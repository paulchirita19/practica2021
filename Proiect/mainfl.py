from flask import Flask, redirect, url_for, render_template
import mysql.connector
import folium
import sys


nume_stadion = ["Stamford Bridge", "Anfield", "Santiago Bernabeu"]
coordonate = []
echipe = ["Liverpool","Chelsea","Real Madrid","Barcelona","Bayern Munchen","Red-Bull Leipzig"]
icon_size = (50 ,50)

app = Flask(__name__)


def calculare_predictie(echipa1 ,echipa2):
    try:
        connection = mysql.connector.connect(host='localhost',
                                             database='practica',
                                             user='root',
                                             password='')
        cursor = connection.cursor()
        cursor.execute("SELECT * FROM `meciuri` WHERE 1")

        myresult = cursor.fetchall()

        echipa1 = echipe[0]
        echipa2 = echipe[1]
        print("\nPrinting each row" ,file=sys.stdout)
        for row in myresult:
            print("Id = ", row[0], file=sys.stdout)
            print("echipa1 = ", row[1] ,file=sys.stdout)
            print("scor1  = ", row[2] ,file=sys.stdout)
            print("echipa2  = ", row[3] ,file=sys.stdout)
            print("scor2   = ", row[4], "\n" ,file=sys.stdout)
        
        return "test"
    
    except mysql.connector.Error as e:
        print("Error reading data from MySQL table", e ,file=sys.stdout)

    finally:
        if connection.is_connected():
            cursor.close()
            connection.close()
            print("MySQL connection is closed",file=sys.stdout)


@app.route("/index")
def home():
    return render_template("index.html")

@app.route("/about")
def about():
    return render_template("about.html")

@app.route("/")
def base():
    # this is base map
    map = folium.Map(
        location=[51.475664764, -0.187999248]
    )
    return map._repr_html_()

@app.route("/mainapp")
def map_marker():
    vec_std = { 0: [folium.IFrame("<b> Nume stadion:" + nume_stadion[0]+ " </b> <br>"+echipe[1]+" vs " + echipe[3] +" </br> <br> Predictie: " + calculare_predictie(echipe[1],echipe[3]) + "</br>")],
                1: [folium.IFrame("<b> Nume stadion:" + nume_stadion[1]+ " </b> <br>"+echipe[0]+" vs " + echipe[4] +" </br> <br> Predictie: " + calculare_predictie(echipe[0],echipe[4]) + "</br>")],
                2: [folium.IFrame("<b> Nume stadion:" + nume_stadion[2]+ " </b> <br>"+echipe[2]+" vs " + echipe[5] +" </br> <br> Predictie: " + calculare_predictie(echipe[2],echipe[5]) + "</br>")]}

    map = folium.Map(
        location=[51.475664764, -0.187999248],
        tiles='Stamen Terrain',
        zoom_start=5
    )
    #stadion1
    folium.Marker(
        location=[51.475664764, -0.187999248],
        popup = folium.Popup(vec_std[0][0], min_width=200, max_width=200),
        tooltip="Click Here!",
        icon = folium.features.CustomIcon('static/css/logo/rsz_londonblue.png',icon_size)
    ).add_to(map)

    #stadion2
    folium.Marker(
        location=[53.430759, -2.961425],
        popup = folium.Popup(vec_std[1][0], min_width=200, max_width=200),
        tooltip="Click Here!",
        icon = folium.features.CustomIcon('static/css/logo/rsz_liverpool.jpg',icon_size)
    ).add_to(map)

    #stadion3
    folium.Marker(
        location=[40.453053, -3.688344],
        popup = folium.Popup(vec_std[2][0], min_width=200, max_width=200),
        tooltip="Click Here!",
        icon = folium.features.CustomIcon('static/css/logo/realmadrid.png',icon_size)
    ).add_to(map)

    return map._repr_html_()

if __name__ == "__main__":
    app.run(debug=True)