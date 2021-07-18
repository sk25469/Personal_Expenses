import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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

  // remember that user inputs are always strings
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter App'),
      ),
      body: Column(
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
          Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              // ignore: prefer_const_literals_to_create_immutables
              children: <Widget>[
                TextField(
                  decoration: const InputDecoration(labelText: 'Title'),
                  // onChanged: (val) => titleInput = val,
                  controller: titleController,
                ),
                TextField(
                  decoration: const InputDecoration(labelText: 'Amount'),
                  controller: amountController,
                ),
                // onChanged: (amt) => amountInput = amt),
                TextButton(
                  style: TextButton.styleFrom(primary: Colors.purple),
                  onPressed: () {
                    print(titleController.text);
                    print(amountController.text);
                  },
                  child: const Text('Add Transaction'),
                )
              ],
            ),
          ),
          // ignore: prefer_const_constructors
          Column(
            // ignore: prefer_const_constructors
            children: transaction
                .map(
                  (tx) => Card(
                    child: Row(
                      children: <Widget>[
                        // amount container
                        Container(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 20,
                          ),
                          child: Text(
                            'Rs ${tx.amount}',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.purple,
                            ),
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.purple,
                              width: 2,
                            ),
                          ),
                          padding: const EdgeInsets.all(5),
                        ),
                        // the title and date
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              tx.title,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              DateFormat.yMMMd().format(tx.date),
                              style: const TextStyle(
                                fontSize: 10,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
