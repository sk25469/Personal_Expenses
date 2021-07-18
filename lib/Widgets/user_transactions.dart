import 'package:flutter/material.dart';
import 'package:personal_expenses/Model/Transaction.dart';
import 'package:personal_expenses/Widgets/transactions_list.dart';

import 'new_transaction.dart';

class UserTransactions extends StatefulWidget {
  const UserTransactions({Key? key}) : super(key: key);

  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _userTransactions = [
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

  void _addNewTransaction({required String txTitle, required double txAmount}) {
    final newTx = Transaction(
      amount: txAmount,
      id: DateTime.now().toString(),
      date: DateTime.now(),
      title: txTitle,
    );

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(_addNewTransaction),
        TransactionList(_userTransactions),
      ],
    );
  }
}
