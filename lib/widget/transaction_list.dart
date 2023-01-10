import '../model/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> listTransaction;
  final Function deleteTransaction;

  const TransactionList(
      {Key? key,
      required this.listTransaction,
      required void Function(String id) this.deleteTransaction})
      : super(key: key);

  //final List<Transaction> _listTransaction = <Transaction>[];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 380,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        //borderRadius: BorderRadius.all(Radius.circular(1)), //default value 5
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(5)),
        border: Border.all(
          color: Colors.purple,
          width: 10, //3
        ),
      ),
      child: ListView.builder(
        itemCount: listTransaction.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            elevation: 6,
            margin: EdgeInsets.all(10),
            child: ListTile(
              leading: Container(
                width: 170, //200 is max limit good size & 170 is perfect
                height: 100, // 100 is good
                // margin: const EdgeInsets.symmetric(
                //   vertical: 10,
                //   horizontal: 15,
                // ),
                // padding: const EdgeInsets.all(10),
                // // width: 100,
                // // height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  border: Border.all(
                    color: Colors.purple,
                    width: 3,
                  ),
                ),
                child: FittedBox(
                  //fit: BoxFit.contain,
                  child: Text(
                    '\$${listTransaction[index].amount.toStringAsFixed(2)}',
                    style: const TextStyle(
                      color: Colors.purple,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'KaushanScript',
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              title: Text(
                listTransaction[index].title,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'KaushanScript',
                  fontSize: 16,
                ),
              ),
              subtitle: Text(
                //DateFormat().format(listTransaction[index].dateTime),//give date & time both
                DateFormat()
                    .add_yMMMEd()
                    .format(listTransaction[index].dateTime),
                style: const TextStyle(
                  color: Colors.grey,
                  // fontWeight: FontWeight.bold,
                  fontFamily: 'KaushanScript',
                  // fontSize: 15,
                ),
              ),
              trailing: IconButton(
                onPressed: () => deleteTransaction(listTransaction[index].id),
                icon: Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
                splashColor: Colors.purple.shade200,
              ),
            ),
          );
        },
      ),
    );
  }
}

//====================Manual List without ListTile()
/**
    Card(
    child: Row(
    children: <Widget>[
    Container(
    margin: const EdgeInsets.symmetric(
    vertical: 10,
    horizontal: 15,
    ),
    padding: const EdgeInsets.all(10),
    // width: 100,
    // height: 50,
    alignment: Alignment.center,
    decoration: BoxDecoration(
    border: Border.all(
    color: Colors.purple,
    width: 2,
    ),
    ),
    child: Text(
    '\$${listTransaction[index].amount.toStringAsFixed(2)}',
    style: const TextStyle(
    color: Colors.purple,
    fontWeight: FontWeight.bold,
    fontFamily: 'KaushanScript',
    fontSize: 20,
    ),
    ),
    ),
    Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
    Text(
    listTransaction[index].title,
    style: const TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontFamily: 'KaushanScript',
    fontSize: 16,
    ),
    ),
    Text(
    DateFormat().format(listTransaction[index].dateTime),
    style: const TextStyle(
    color: Colors.grey,
    // fontWeight: FontWeight.bold,
    fontFamily: 'KaushanScript',
    // fontSize: 15,
    ),
    ),
    ],
    ),
    ],
    ),
    )

 **/

///=================BELOW IS THE CODE FOR ListView========================///
///==ListView is the combination of Column() with SingleChildScrolView()==///
///==ListView.builder() need context and index (as count) and don't need==///
///children: listTransaction.map((tx) {...code like tx.dateTime, tx.title,///
///=====================,tx.amount...}).toList(),=========================///
///=======================================================================///
// import '../model/transaction.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
//
// class TransactionList extends StatelessWidget {
//   final List<Transaction> listTransaction;
//
//   const TransactionList(
//       {Key? key, required List<Transaction> this.listTransaction})
//       : super(key: key);
//
//   //final List<Transaction> _listTransaction = <Transaction>[];
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 300,
//       child: ListView(
//         children: listTransaction.map((tx) {
//           return Card(
//             child: Row(
//               children: <Widget>[
//                 Container(
//                   margin: EdgeInsets.symmetric(
//                     vertical: 10,
//                     horizontal: 15,
//                   ),
//                   padding: EdgeInsets.all(10),
//                   // width: 100,
//                   // height: 50,
//                   alignment: Alignment.center,
//                   decoration: BoxDecoration(
//                     border: Border.all(
//                       color: Colors.purple,
//                       width: 2,
//                     ),
//                   ),
//                   child: Text(
//                     '\$${tx.amount}',
//                     style: TextStyle(
//                       color: Colors.purple,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 20,
//                     ),
//                   ),
//                 ),
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     Text(
//                       tx.title,
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 15,
//                       ),
//                     ),
//                     Text(
//                       DateFormat().format(tx.dateTime),
//                       style: TextStyle(
//                         color: Colors.grey,
//                         // fontSize: 15,
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           );
//         }).toList(),
//       ),
//     );
//   }
// }
