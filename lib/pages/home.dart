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
  //late Data data;
  DataService dataService = DataService();

    /*@override
    Future<void> initState() async {
      super.initState();
      dateTime = DateTime.now();
      data = await DataService().getData(dateTime);
    }*/

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('WeatherPI'),
          backgroundColor: Colors.lightGreen,
          actions: [
            IconButton(onPressed: () => {
              Navigator.pushNamed(context, "/history")
            }, icon: const Icon(Icons.history))
          ],
        ),
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                /*'Temperature: ${data.temperature}°C',
                style: const TextStyle(fontSize: 20),*/
                "Tempreature"
              ),
              Text(
                /*'Humidity: ${data.humidity}%',
                style: const TextStyle(fontSize: 20),*/
                "Humidity"
              ),
              Text(
                /*'Pressure: ${data.pressure} hPa',
                style: const TextStyle(fontSize: 20),*/
                "Pressure"
              ),
            ],
          ),
        ),
      );
    }
}
