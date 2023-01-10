import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './chart_bar.dart';

import '../model/transaction.dart';

class Chart extends StatelessWidget {
  final List<Transaction> listTransaction;

  const Chart({Key? key, required this.listTransaction}) : super(key: key);
//looping through list [listTransaction.length]
  /// in below lines List<Map<String,Object>>  Object can be used for int or
  /// double values like calculation and these values should not be null like
  /// this error messages value receiver null and return null values
  /// [double totalSum;] because we didn't initialized
  /// like [double totalSum = 0]; values must be initialized in latest
  /// flutter null safety
  /// 1st important thing when we use Object in [List<Map<String, Object>>]
  /// then it means we need to do like this (item['amount'] as double)
  /// because 'amount' is a key: String: and inside String , double value is
  /// stored 2nd important thing we prefert to use Object over dynamic
  /// because dynamic gives error but in dynamic we don't need to do like
  /// this parsing double (e['amount'] as double)
  /// NOTE: try to check both if u get errors in future projects, prefer Object.
  List<Map<String, Object>> get getTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      //we cannot and we should not use var in [double totalSum = 0;]
      //var is not a good practice
      double totalSum = 0;
      for (var i = 0; i < listTransaction.length; i++) {
        if (listTransaction[i].dateTime.day == weekDay.day &&
            listTransaction[i].dateTime.month == weekDay.month &&
            listTransaction[i].dateTime.year == weekDay.year) {
          totalSum += listTransaction[i].amount;
        }
      }
      return {
        //below line .substring give us Monday to M only
        //'day': DateFormat.E().format(weekDay).substring(0, 1),
        'day': DateFormat.E().format(weekDay),
        'amount': totalSum,
      };
      //});// list.generate this will show weekDays from RtL right to left
      //like Thur Wed Tue Mon Sun Sat and if we need LtR then we need to
      // reverse the list like below
    }).reversed.toList();
  }

  double get totalSpending {
    //return getTransactionValues.fold(0.0, (previousValue, nextValue is called element) {
    return getTransactionValues.fold(0.0, (sum, item) {
      return sum + (item['amount'] as double); //for List<Map<String, Object>>
      //return sum + item['amount']; //for List<Map<String, dynamic>>
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(10), //default value 10
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: getTransactionValues.map((e) {
            //return Text('${e['day']}:${e['amount']}'); for test in Text
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                label: '${e['day']}',
                spendingAmount:
                    (e['amount'] as double), //for List<Map<String, Object>>
                //spendingAmount: e['amount'],//for List<Map<String, dynamic>>
                //below this if (totalSpending == 0.0) we can not get
                // height fraction <= 0.0 error remember
                percentageSpendingAmount: totalSpending == 0.0
                    ? 0.0
                    : (e['amount'] as double) / totalSpending,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
