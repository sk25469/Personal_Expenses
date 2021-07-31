import 'package:flutter/material.dart';
import '../Model/Transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  // ignore: use_key_in_widget_constructors
  const TransactionList(this.transactions);
  @override
  Widget build(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return Container(
      height: 500,
      child: transactions.isEmpty
          ? Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: <Widget>[
                Text(
                  'No transactions added yet!',
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(height: 15),
                // ignore: sized_box_for_whitespace
                Container(
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  child: Row(
                    children: <Widget>[
                      // amount container
                      Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 20,
                        ),
                        child: Text(
                          'Rs ${transactions[index].amount.toStringAsFixed(2)}',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Theme.of(context).primaryColor,
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
                            transactions[index].title,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            DateFormat.yMMMd().format(transactions[index].date),
                            style: const TextStyle(
                              fontSize: 10,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
              itemCount: transactions.length,
              // ignore: prefer_const_constructors
            ),
    );
  }
}
