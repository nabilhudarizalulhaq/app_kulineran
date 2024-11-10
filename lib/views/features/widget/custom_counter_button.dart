import 'package:apps_kulineran/views/globals/theme.dart';
import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 0) {
        _counter--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 27,
      width: 115,
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          IconButton(
            onPressed: _decrementCounter,
            icon: Icon(Icons.remove),
            iconSize: 15,
            color: white,
          ),
          Text(
              '$_counter',
              style: whiteTextStyle.copyWith(
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
          IconButton(
            onPressed: _incrementCounter,
            icon: Icon(Icons.add),
            iconSize: 15,
            color: white,
          ),
        ],
      ),
    );
  }
}
