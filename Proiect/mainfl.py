from flask import Flask, redirect, url_for, render_template
#from flask_mysqldb import MySQL
import mysql.connector
import folium
import sys
import numpy as np


nume_stadion = [ "Anfield","Stamford Bridge", "Camp Nou"]
echipe = ["Chelsea","Liverpool","Real Madrid","Barcelona","Bayern Munchen","Red-Bull Leipzig"]
#iframe = folium.IFrame("<b> Nume echipa: Chelsea </b> <br> Adversar: Liverpool </br> <br> Predictie: 3-1 </br>")
icon_size = (50 ,50)
#popup = folium.Popup(iframe, min_width=300, max_width=300)

app = Flask(__name__)

def calculare_scor(echipa1,echipa2):
    try:
        connection = mysql.connector.connect(host='localhost',
                                             database='practica',
                                             user='root',
                                             password='')
        cursor = connection.cursor()
        cursor.execute("SELECT * FROM `meciuri` WHERE echipa1= '"+echipa1+"' and echipa2='"+echipa2+"'")
        #cursor.execute("SELECT * FROM `meciuri` WHERE echipa1 = Chelsea")
        myresult = cursor.fetchall()
        
        scor1 ,scor2 = [] , []
        #rcount = int(cursor.rowcount)
        for row in myresult:
            scor1.append(row[2])
            scor2.append(row[4])

        
        scor1_t = np.array([scor1]).T
        scor2_t = np.array([scor2]).T
        #inputs = np.concatenate((scor1_t,scor2_t),axis=1)
        return scor1_t ,scor2_t


    except mysql.connector.Error as e:
        print("Error reading data from MySQL table", e ,file=sys.stdout)

    finally:
        if connection.is_connected():
            cursor.close()
            connection.close()
            print("MySQL connection is closed",file=sys.stdout)


#initizare scouri cu cele din baza de date

#scor1 ,scor2 =  calculare_scor(echipe[1],echipe[0])

#concatenare scoruri
#inputs = np.concatenate((scor1,scor2),axis=1)

# 0 cand pierde echipa1 . 1 cand castiga echipa1 , pas daca e 0-0
def calculare_rezultat_asteptat(echipa1,echipa2):
    scor1 , scor2 = calculare_scor(echipa1,echipa2)
    rezultat_asteptat = [0 for i in range(len(scor1))] 
    for i in range(len(scor1)):
        if scor1[i] < scor2[i]:
            rezultat_asteptat[i] = 0
        elif scor1[i] > scor2[i]:
            rezultat_asteptat[i] = 1
        else:
            rezultat_asteptat[i] = 0 #trebuie refacut la egal
    
    return np.array([rezultat_asteptat]).T

#expected_output = calculare_rezultat_asteptat(echipa1,echipa2)

epochs = 10000
lr = 0.1
inputLayerNeurons, hiddenLayerNeurons, outputLayerNeurons = 2,2,1

def sigmoid (x):
    return 1/(1 + np.exp(-x))

def sigmoid_derivative(x):
    return x * (1 - x)

#Training algorithm
def train_team_scor(echipa1,echipa2):
    scor1 ,scor2 =  calculare_scor(echipa1,echipa2)
    inputs = np.concatenate((scor1,scor2),axis=1)
    #Random weights and bias initialization
    hidden_weights = np.random.uniform(size=(inputLayerNeurons,hiddenLayerNeurons))
    hidden_bias =np.random.uniform(size=(1,hiddenLayerNeurons))
    output_weights = np.random.uniform(size=(hiddenLayerNeurons,outputLayerNeurons))
    output_bias = np.random.uniform(size=(1,outputLayerNeurons))

    expected_output = calculare_rezultat_asteptat(echipa1,echipa2)

    for _ in range(epochs):
	#Forward Propagation
	    hidden_layer_activation = np.dot(inputs,hidden_weights)
	    hidden_layer_activation += hidden_bias
	    hidden_layer_output = sigmoid(hidden_layer_activation)

	    output_layer_activation = np.dot(hidden_layer_output,output_weights)
	    output_layer_activation += output_bias
	    predicted_output = sigmoid(output_layer_activation)

	    #Backpropagation
	    error = expected_output - predicted_output
	    d_predicted_output = error * sigmoid_derivative(predicted_output)
	
	    error_hidden_layer = d_predicted_output.dot(output_weights.T)
	    d_hidden_layer = error_hidden_layer * sigmoid_derivative(hidden_layer_output)

	    #Updating Weights and Biases
	    output_weights += hidden_layer_output.T.dot(d_predicted_output) * lr
	    output_bias += np.sum(d_predicted_output,axis=0,keepdims=True) * lr
	    hidden_weights += inputs.T.dot(d_hidden_layer) * lr
	    hidden_bias += np.sum(d_hidden_layer,axis=0,keepdims=True) * lr

    return predicted_output

def calculare_ma_predictii(echipa1,echipa2):
    predictie = train_team_scor(echipa1,echipa2)
    print("Predictie:")
    for i in range(len(predictie)):
        if predictie[i] < 0.5:
            predictie[i] = 0
        else:
            predictie[i] = 1
    return np.mean(predictie.T)


def calculare_predictie(echipa1,echipa2):
    ma = calculare_ma_predictii(echipa1,echipa2)
    if ma <= 0.5:
        str1 = echipa2 + " castiga"
    else:
        str1 = echipa1 + " castiga"
    return str1


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
        location=[53.430759, -2.961425],
        zoom_start=5
    )
    return map._repr_html_()
@app.route("/mainapp")
def map_marker():
    #print("scor_final", scor_final ,file=sys.stdout)
    #print("inputs", inputs ,file=sys.stdout)
    #print("rezultat_asteptat \n", expected_output.T ,file=sys.stdout)
    #print(afisare_predictie() ,"\n")
    vec_std = { 0: [folium.IFrame("<b> Nume stadion:" + nume_stadion[0]+ " </b> <br>"+echipe[1]+" vs " + echipe[0] +" </br> <br> Predictie: " + calculare_predictie(echipe[1],echipe[0]) + "</br>")],
                1: [folium.IFrame("<b> Nume stadion:" + nume_stadion[1]+ " </b> <br>"+echipe[4]+" vs " + echipe[2] +" </br> <br> Predictie: " + calculare_predictie(echipe[4],echipe[2]) + "</br>")],
                2: [folium.IFrame("<b> Nume stadion:" + nume_stadion[2]+ " </b> <br>"+echipe[3]+" vs " + echipe[5] +" </br> <br> Predictie: " + calculare_predictie(echipe[3],echipe[5]) + "</br>")]}

    #iframe = folium.IFrame("<b> Nume stadion:" + nume_stadion[0]+ " </b> <br> Adversar: Liverpool </br> <br> Predictie: " + str(calculare_predictie()) + "-1 </br>")
    # this map using stamen terrain
    # we add some marker here
    map = folium.Map(
        location=[53.430759, -2.961425],
        tiles='Stamen Terrain',
        zoom_start=5
    )

    #stadion1
    folium.Marker(
        location=[53.430759, -2.961425],
        popup = folium.Popup(vec_std[0][0], min_width=250, max_width=250),
        tooltip="Click Here!",
        icon = folium.features.CustomIcon('practica2021/Proiect/static/css/logo/rsz_liverpool.jpg',icon_size)
    ).add_to(map)

    #stadion2
    folium.Marker(
        location=[48.218967, 11.623746],
        popup = folium.Popup(vec_std[1][0], min_width=250, max_width=250),
        tooltip="Click Here!",
        icon = folium.features.CustomIcon('practica2021/Proiect/static/css/logo/Allianz_Arena-logo_blue.png',icon_size)
    ).add_to(map)

    #stadion3
    folium.Marker(
        location=[41.380898, 2.122820],
        popup = folium.Popup(vec_std[2][0], min_width=250, max_width=250),
        tooltip="Click Here!",
        icon = folium.features.CustomIcon('practica2021/Proiect/static/css/logo/fcbarcelona.jpg',icon_size)
    ).add_to(map)

    return map._repr_html_()

if __name__ == "__main__":
    app.run(debug=True)