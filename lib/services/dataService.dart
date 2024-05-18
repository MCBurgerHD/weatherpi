import 'dart:convert';
import 'package:http/http.dart' as http;
import '../domain/data.dart';

class DataService {

  final String pathToDB = "https://weatherpi-4a79b-default-rtdb.europe-west1.firebasedatabase.app/";

  String temperature = '';
  String humidity = '';
  String pressure = '';
  String time = '';

  Future<List<Data>> getAll() async {
    List<Data> lst = [];
    var url = Uri.parse("$pathToDB/data.json");
    var response = await http.get(url);

    if (response.statusCode == 200) {
      try {
        final List<dynamic> data = json.decode(response.body) ?? [];

        for (var element in data) {
          if (element != null) {
            lst.add(Data.fromJSON(Map.castFrom(element)));
          }
        }
      } catch (err) {
        final Map<String, dynamic> data = json.decode(response.body);
        data.forEach((key, value) {
          lst.add(Data.fromJSON(value));
        });
      }

      return lst;
    } else {
      throw "Something went wrong while getting all Data";
    }
  }

  Future<Data> getData(DateTime time) async {
    var url = Uri.parse("$pathToDB/data/$time.json");

    try {
      var response = await http.get(url);

      if (response.statusCode == 200) {
        return Data.fromJSON(json.decode(response.body));
      }

      throw "Something went wrong while searching for Time: $time";
    } catch (error) {
      throw "Time $time not found";
    }
  }
}