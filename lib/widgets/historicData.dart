import 'package:flutter/material.dart';
import 'package:weatherpi/domain/data.dart';


class DataTile extends StatefulWidget {
  const DataTile(
      {super.key,
        required this.data,});

  final Data data;

  @override
  State<DataTile> createState() => _PublicTileState();
}

class _PublicTileState extends State<DataTile> {

  @override
  Widget build(BuildContext context) {

    return ListTile(
      title: Text(widget.data.time),
      trailing: const SizedBox(
        width: 100.0,
        height: 500.0,
      ),
    );
  }
}