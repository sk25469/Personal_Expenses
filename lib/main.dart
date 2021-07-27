import 'package:flutter/material.dart';
import 'package:personal_expenses/Widgets/user_transactions.dart';

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
  // remember that user inputs are always strings

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter App'),
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Card(
              // ignore: sized_box_for_whitespace
              child: Container(
                color: Colors.red,
                width: double.infinity,
                // ignore: prefer_const_constructors
                child: Text("Chart"),
              ),
              elevation: 6,
            ),
            const UserTransactions(),
          ],
        ),
      ),
    );
  }
}
