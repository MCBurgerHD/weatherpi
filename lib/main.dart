import 'package:flutter/material.dart';
import 'package:weatherpi/pages/data.dart';
import 'package:weatherpi/pages/history.dart';
import 'package:weatherpi/pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'WeatherPI',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreen),
          useMaterial3: true,
        ),
        initialRoute: "/",
        debugShowCheckedModeBanner: false,
        routes: {
          "/": (context) => const Home(),
          "/history": (context) => const History(),
          "/data": (context) => const DataPage(),
        }
    );
  }
}
