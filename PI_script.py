import requests
from sense_hat import SenseHat
import json
import time
from datetime import datetime

# Sense HAT initialisieren
sense = SenseHat()

# Firebase Realtime Database URL
firebase_url = 'https://weatherpi-4a79b-default-rtdb.europe-west1.firebasedatabase.app/data/'

# Kompass richtungen
def get_compass_direction():
    # Magnetometer-Daten abrufen
    mag = sense.get_compass_raw()
    x = mag['x']
    y = mag['y']
    
    # Winkel in Grad berechnen
    angle = math.atan2(y, x) * (180 / math.pi)
    
    # Winkel normalisieren (0 bis 360 Grad)
    if angle < 0:
        angle += 360

    # Himmelsrichtung bestimmen
    if 22.5 < angle <= 67.5:
        direction = "Nordost"
    elif 67.5 < angle <= 112.5:
        direction = "Ost"
    elif 112.5 < angle <= 157.5:
        direction = "Südost"
    elif 157.5 < angle <= 202.5:
        direction = "Süd"
    elif 202.5 < angle <= 247.5:
        direction = "Südwest"
    elif 247.5 < angle <= 292.5:
        direction = "West"
    elif 292.5 < angle <= 337.5:
        direction = "Nordwest"
    else:
        direction = "Nord"

    return direction


while True:
# Daten lesen
    temperature = round(sense.get_temperature(), 2)
    humidity = round(sense.get_humidity(), 2)
    pressure = round(sense.get_pressure(), 2)
    now = datetime.now()
    currentTime = now.strftime("%Y-%m-%d %H:%M:%S")
    direction = get_compass_direction

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
    
    time.sleep(30)
