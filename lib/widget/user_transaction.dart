/**import 'package:expense_planner/widget/new_transaction.dart';
import 'package:expense_planner/widget/transaction_list.dart';
import 'package:flutter/material.dart';

import '../model/transaction.dart';

class UserTransaction extends StatefulWidget {
  const UserTransaction({Key? key}) : super(key: key);

  @override
  State<UserTransaction> createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _listTransaction = <Transaction>[
    Transaction(
      //Dummy Values
      id: 't1',
      title: 'New Shoes',
      amount: 999.99,
      dateTime: DateTime.now(),
    ),
    Transaction(
      //Dummy Values
      id: 't21',
      title: 'Weekly Groceries',
      amount: 100.99,
      dateTime: DateTime.now(),
    ),
  ];

  //below we created [_newUserTransaction] method because we need to manage our
  // list of transaction. assign user

  void _addNewTransactionButton(String txTitle, double txAmount) {
    //i assign [Transaction()] to a new varable like variable inside list [newTx]
    final newTx = Transaction(
      //This is not Dummy Values
      //[_listTransaction] is final property that's why we can not allowed to
      //change [_listTransaction] after = part but we simply add to the _listTransaction
      //it won't effect the final property that's why we create [newTx]
      id: DateTime.now().toString(),
      title: txTitle,
      amount: txAmount,
      dateTime: DateTime.now(),
    );
    setState(() {
      _listTransaction.add(newTx);
      //print('new transaction button clicked = ${_listTransaction.toList()}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(addNewTransactionButton: _addNewTransactionButton),
        TransactionList(
          listTransaction: _listTransaction,
        ),
      ],
    );
  }
}
**/
