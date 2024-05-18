import requests
from sense_hat import SenseHat
import json
import time
from datetime import datetime

# Sense HAT initialisieren
sense = SenseHat()

# Firebase Realtime Database URL
firebase_url = 'https://weatherpi-4a79b-default-rtdb.europe-west1.firebasedatabase.app/'

while True:
# Daten lesen
    temperature = round(sense.get_temperature(), 2)
    humidity = round(sense.get_humidity(), 2)
    pressure = round(sense.get_pressure(), 2)
    now = datetime.now()
    currentTime = now.strftime("%Y-%m-%d %H:%M:%S")

    # Daten als JSON formatieren
    data = {
        'time': currentTime,
        'temperature': temperature,
        'humidity': humidity,
        'pressure': pressure
    }
    
    # Daten in JSON konvertieren
    json_data = json.dumps(data)

    # HTTP POST Request an Firebase senden
    response = requests.post(firebase_url + str(int(time.time())) + ".json", json=data)

    # Antwort überprüfen
    if response.status_code == 200:
        print("Daten erfolgreich an Firebase gesendet.")
    else:
        print("Fehler beim Senden der Daten an Firebase:", response.text)
    
    time.sleep(30)
