import requests
from sense_hat import SenseHat
import json
import time
from datetime import datetime

# Sense HAT initialisieren
sense = SenseHat()

# Firebase Realtime Database URL
firebase_url = 'https://weatherpi-4a79b-default-rtdb.europe-west1.firebasedatabase.app/data/'

# Himmelsrichtung

def getDirection(deg):
    wind_dir_name = ['North', 'NorthEast', 'East', 'SoutEast', 'South', 'SouthWest', 'West', 'NorthWest', 'North']
    wind_sections = 360 / 8
    offset = wind_sections / 2
    y = int((deg + offset) / wind_sections)
    wind_dir_txt = wind_dir_name[y]
    return wind_dir_txt


while True:
    # Daten lesen
    temperature = round(sense.get_temperature(), 2)
    humidity = round(sense.get_humidity(), 2)
    pressure = round(sense.get_pressure(), 2)
    now = datetime.now()
    currentTime = now.strftime("%Y-%m-%d %H:%M:%S")
    direction = getDirection(sense.get_compass())

    # Daten als JSON formatieren
    data = {
        'time': currentTime,
        'temperature': temperature,
        'humidity': humidity,
        'pressure': pressure,
        'direction': direction
    }

    # Daten in JSON konvertieren
    json_data = json.dumps(data)

    # HTTP POST Request an Firebase senden
    response = requests.put(firebase_url + str(currentTime) + ".json", json=data)

    # Antwort überprüfen
    if response.status_code == 200:
        print("Daten erfolgreich an Firebase gesendet.")
    else:
        print("Fehler beim Senden der Daten an Firebase:", response.text)

    # Wartezeit zwischen den Datensendungen (z.B. 60 Sekunden)
    time.sleep(30)