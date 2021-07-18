import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function addTransactionHandler;

  // ignore: use_key_in_widget_constructors
  NewTransaction(this.addTransactionHandler);

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
          ),
          TextField(
            decoration: const InputDecoration(labelText: 'Amount'),
            controller: amountController,
          ),
          // onChanged: (amt) => amountInput = amt),
          TextButton(
            style: TextButton.styleFrom(primary: Colors.purple),
            onPressed: () {
              addTransactionHandler(
                  txTitle: titleController.text,
                  txAmount: double.parse(amountController.text));
              print(titleController.text);
              print(amountController.text);
            },
            child: const Text('Add Transaction'),
          )
        ],
      ),
    );
  }
}
