import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmt;
  final double spendingPctofTotal;

  ChartBar(
      {required this.label,
      required this.spendingAmt,
      required this.spendingPctofTotal});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // a fitted box compels the object inside to just take the width as defined
        FittedBox(child: Text('Rs. ${spendingAmt.toStringAsFixed(0)}')),
        const SizedBox(height: 5),
        // ignore: sized_box_for_whitespace
        Container(
          height: 60,
          width: 10,
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1.5),
                  color: const Color.fromRGBO(220, 220, 220, 1),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              FractionallySizedBox(
                heightFactor: spendingPctofTotal,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 6),
        Text(label),
      ],
    );
  }
}
