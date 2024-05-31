import 'dart:html';

class Data {
  late String time; // yyyy-MM-dd hh:mm:ss
  late double temperature;
  late double humidity;
  late double pressure;
  late String direction;

  Data({
    required this.time,
    required this.temperature,
    required this.humidity,
    required this.pressure,
    required this.direction,
  });

  Data.defaultData() {
    time = DateTime.now().toString();
    temperature = 0;
    humidity = 0;
    pressure = 0;
    direction = "";
  }

  Map<String, dynamic> toJson() {
    return {
      'time': time.toString(),
      'temperature': temperature,
      'humidity': humidity,
      'pressure': pressure,
      'direction': direction,
    };
  }

  @override
  String toString() {
    return """{
    'time': ${time.toString()},
      'temperature': $temperature,
      'humidity': $humidity,
      'pressure': $pressure,
      'direction': $direction,
    }""";
  }

  factory Data.fromJSON(Map<String, dynamic> jsonMap) {
    return Data(
      time: jsonMap['time'],
      temperature: jsonMap['temperature'],
      humidity: jsonMap['humidity'],
      pressure: jsonMap['pressure'],
      direction: jsonMap['direction'],
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Data && runtimeType == other.runtimeType && time == other.time;

  @override
  int get hashCode => time.hashCode;
}
