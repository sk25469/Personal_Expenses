import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTransactionHandler;

  NewTransaction(this.addTransactionHandler);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;

    if (amountController.text.isEmpty) {
      return;
    }

    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount < 0) {
      return;
    }

    widget.addTransactionHandler(
        txTitle: titleController.text,
        txAmount: double.parse(amountController.text));

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        // ignore: prefer_const_literals_to_create_immutables
        children: <Widget>[
          TextField(
            decoration: const InputDecoration(labelText: 'Title'),
            // onChanged: (val) => titleInput = val,
            controller: titleController,

            // to add transaction when we press enter on keyboard
            onSubmitted: (_) => submitData(),
          ),
          TextField(
            decoration: const InputDecoration(labelText: 'Amount'),
            controller: amountController,

            // to have input keyboard as numbers
            keyboardType: TextInputType.number,

            // to add transaction when we press enter on keyboard
            onSubmitted: (_) => submitData(),
          ),
          // onChanged: (amt) => amountInput = amt),
          TextButton(
            style: TextButton.styleFrom(primary: Colors.purple),
            onPressed: submitData,
            child: const Text('Add Transaction'),
          )
        ],
      ),
    );
  }
}
