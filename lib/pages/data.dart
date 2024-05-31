import 'package:flutter/material.dart';
import 'package:weatherpi/domain/data.dart';

class DataPage extends StatefulWidget {
  const DataPage({super.key});

  @override
  State<DataPage> createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {

  late Data data;

  @override
  Widget build(BuildContext context) {

    data = ModalRoute.of(context)!.settings.arguments as Data;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: Text(data.time),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Temperature: ${data.temperature}°C',
                style: const TextStyle(fontSize: 20),
            ),
            Text(
              'Humidity: ${data.humidity}%',
                style: const TextStyle(fontSize: 20),
            ),
            Text(
              'Pressure: ${data.pressure} hPa',
                style: const TextStyle(fontSize: 20),
            ),
            Text(
              'Direction: ${data.direction}',
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
