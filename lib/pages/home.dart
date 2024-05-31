import 'package:flutter/material.dart';
import 'package:weatherpi/services/dataService.dart';

import '../domain/data.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  late DateTime dateTime;
  late Data data = Data.defaultData();
  DataService dataService = DataService();

  Future<void> getData(uid) async {
    data = await DataService().getData(uid);
  }

    @override
    Widget build(BuildContext context) {
    getData(DateTime.now());
      return Scaffold(
        appBar: AppBar(
          leading: Image.asset("weatherPI.jpeg"),
          title: const Text('WeatherPI'),
          backgroundColor: Colors.lightGreen,
          actions: [
            IconButton(onPressed: () => {
              Navigator.pushNamed(context, "/history")
            }, icon: const Icon(Icons.history))
          ],
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
            ],
          ),
        ),
      );
    }
}
