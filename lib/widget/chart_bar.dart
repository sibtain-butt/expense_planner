import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double percentageSpendingAmount;
  ChartBar({
    Key? key,
    required this.label,
    required this.spendingAmount,
    required this.percentageSpendingAmount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 20,
          child: FittedBox(
            fit: BoxFit.contain,
            child: Text(
              '\$${spendingAmount.toStringAsFixed(0)}',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.purple,
                fontWeight: FontWeight.bold,
                fontFamily: 'KaushanScript',
                fontSize: 16,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 4,
        ),
        SizedBox(
          width: 30, //10 default video value
          height: 80, //60 default video value
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.purple,
                    width: 2,
                  ),
                  //RedGreenBlueOpacity and Values from 0 to 255
                  //color: Color.fromRGBO(220, 220, 220, 1),
                  color: Colors.white,

                  borderRadius: BorderRadius.circular(5), //10 default value
                ),
              ),
              FractionallySizedBox(
                //widthFactor: ,
                heightFactor: percentageSpendingAmount,
                child: Container(
                  width: 30,
                  // height: 80,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.purple,
                      width: 2,
                    ),
                    //RedGreenBlueOpacity and Values from 0 to 255
                    //color: Color.fromRGBO(220, 220, 220, 1),
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(5), //10 default value
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Text(
          '${label}',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.purple,
            fontWeight: FontWeight.bold,
            fontFamily: 'KaushanScript',
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
