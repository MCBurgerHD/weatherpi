class Data {
  late String time; // yyyy-MM-dd hh:mm:ss
  late double temperature;
  late double humidity;
  late double pressure;

  Data({
    required this.time,
    required this.temperature,
    required this.humidity,
    required this.pressure,
  });

  Map<String, dynamic> toJson() {
    return {
      'time': time.toString(),
      'temperature': temperature,
      'humidity': humidity,
      'pressure': pressure,
    };
  }

  @override
  String toString() {
    return """{
    'time': ${time.toString()},
      'temperature': $temperature,
      'humidity': $humidity,
      'pressure': $pressure,
    }""";
  }

  factory Data.fromJSON(Map<String, dynamic> jsonMap) {
    return Data(
      time: jsonMap['time'],
      temperature: jsonMap['temperature'],
      humidity: jsonMap['humidity'],
      pressure: jsonMap['time'],
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Data && runtimeType == other.runtimeType && time == other.time;

  @override
  int get hashCode => time.hashCode;
}
