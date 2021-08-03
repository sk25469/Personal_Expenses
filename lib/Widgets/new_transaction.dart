import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTransactionHandler;

  NewTransaction(this.addTransactionHandler);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;

  void _submitData() {
    final enteredTitle = _titleController.text;

    if (_amountController.text.isEmpty || _selectedDate == null) {
      return;
    }

    final enteredAmount = double.parse(_amountController.text);

    if (enteredTitle.isEmpty || enteredAmount < 0) {
      return;
    }

    widget.addTransactionHandler(
      txTitle: _titleController.text,
      txAmount: double.parse(_amountController.text),
      txDate: _selectedDate,
    );

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then(
      (pickedDate) {
        if (pickedDate == null) {
          return;
        }
        setState(() {
          _selectedDate = pickedDate;
        });
      },
    );
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
            controller: _titleController,

            // to add transaction when we press enter on keyboard
            onSubmitted: (_) => _submitData(),
          ),
          TextField(
            decoration: const InputDecoration(labelText: 'Amount'),
            controller: _amountController,

            // to have input keyboard as numbers
            keyboardType: TextInputType.number,

            // to add transaction when we press enter on keyboard
            onSubmitted: (_) => _submitData(),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 8, 0, 0),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    (_selectedDate == null)
                        ? 'No date choosen'
                        : 'Picked Date : ${DateFormat.yMd().format(_selectedDate!)}',
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: _presentDatePicker,
                  child: Text(
                    'Choose Date',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: ElevatedButton(
              style:
                  TextButton.styleFrom(primary: Theme.of(context).primaryColor),
              onPressed: _submitData,
              child: Text(
                'Add Transaction',
                style:
                    TextStyle(color: Theme.of(context).textTheme.button!.color),
              ),
            ),
          )
        ],
      ),
    );
  }
}
