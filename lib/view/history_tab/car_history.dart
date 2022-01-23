import 'package:flutter/material.dart';

class CarHistory extends StatefulWidget {
  @override
  _CarHistoryState createState() => _CarHistoryState();
}

class _CarHistoryState extends State<CarHistory> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Car',
        ),
      ),
    );
  }
}
