import 'package:flutter/material.dart';
import './Model/Transaction.dart';

void main() => runApp(MyApp());

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

// ignore: use_key_in_widget_constructors
class MyHomePage extends StatelessWidget {
  final List<Transaction> transaction = [
    Transaction(
      amount: 69.420,
      id: "1",
      date: DateTime.now(),
      title: "My new phone",
    ),
    Transaction(
      amount: 420.69,
      id: "2",
      date: DateTime.now(),
      title: "My new mechanical keyboard",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter App'),
      ),
      body: Column(
        children: <Widget>[
          Card(
            // ignore: sized_box_for_whitespace
            child: Container(
              width: double.infinity,
              child: Text("Chart"),
            ),
            elevation: 6,
          ),
          Card(
            child: Text("List of TXN"),
          ),
        ],
      ),
    );
  }
}
