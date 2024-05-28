import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weatherpi/domain/data.dart';
import 'package:weatherpi/services/dataService.dart';
import 'package:weatherpi/widgets/historicData.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  List<Data> created = [];

  Future<void> getData() async {
    created = await DataService().getAll();
  }

  @override
  initState() {
    super.initState();
    getData();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: const Text("Historic Data"),
      ),
      body: Expanded(
            child: ListView.builder(
                itemCount: created.length,
                itemBuilder: (context, index) {
                  final data = created.elementAt(index);

                  return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, "/data");
                      },
                      child: Container(
                          margin: const EdgeInsets.fromLTRB(
                              100.0, 10.0, 100.0, 10.0),
                          decoration: BoxDecoration(
                              border:
                              Border.all(color: Colors.lightGreen),
                              color: Colors.lightGreen),
                          child: DataTile(data: data)
                      )
                  );
                }
            ))
      );
  }
}
