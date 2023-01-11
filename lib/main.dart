import 'package:expense_planner/widget/new_transaction.dart';
import 'package:expense_planner/widget/transaction_list.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'model/transaction.dart';
import 'widget/chart.dart';

//void main() => runApp(const MyApp());

void main() {
  runApp(const MyApp());
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('assets/fonts/Allura/OFL.txt');
    yield LicenseEntryWithLineBreaks(['Allura-Regular'], license);
  });
  LicenseRegistry.addLicense(() async* {
    final license =
        await rootBundle.loadString('assets/fonts/KaushanScript/OFL.txt');
    yield LicenseEntryWithLineBreaks(['KaushanScript'], license);
  });
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.purple,
        appBarTheme: const AppBarTheme(
          //backgroundColor: Colors.white,
          backgroundColor: Colors.purple,
          elevation: 0,
          titleTextStyle: TextStyle(
            //color: Colors.purple,
            color: Colors.white,
            fontFamily: 'Allura-Regular',
            fontWeight: FontWeight.bold,
            fontSize: 40,
          ),
        ),
        primarySwatch: Colors.purple,
        // textTheme: ThemeData.dark().textTheme.copyWith(
        //       titleLarge: TextStyle(
        //         fontFamily: 'KaushanScript',
        //         fontWeight: FontWeight.bold,
        //         color: Colors.purple,
        //         fontSize: 20,
        //       ),
        //     ),
      ),
      title: 'FlutterApp',
      home: const _MyHomePage(),
    );
  }
}

class _MyHomePage extends StatefulWidget {
  const _MyHomePage();

  @override
  State<_MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<_MyHomePage> {
  // String titleInput = '';
  final List<Transaction> _listTransaction = <Transaction>[
    //i want to make my list empty that's why i commenting them
    //because i am using .gif haha... it's a dummy record afterAll.
    // Transaction(
    //   //Dummy Values
    //   id: 't1',
    //   title: 'New Shoes',
    //   amount: 999.99,
    //   dateTime: DateTime.now(),
    // ),
    // Transaction(
    //   //Dummy Values
    //   id: 't21',
    //   title: 'Weekly Groceries',
    //   amount: 100.99,
    //   dateTime: DateTime.now(),
    // ),
  ];

  //to Delete transaction
  void _deleteTransaction(String id) {
    setState(() {
      _listTransaction.removeWhere((txElement) => txElement.id == id);
    });
  }

  //below we created [_newUserTransaction] method because we need to manage our
  void _addNewTransactionButton(
      String txTitle, double txAmount, DateTime chosenDate) {
    //i assign [Transaction()] to a new varable like variable inside list [newTx]
    final newTx = Transaction(
      //This is not Dummy Values
      //[_listTransaction] is final property that's why we can not allowed to
      //change [_listTransaction] after = part but we simply add to the _listTransaction
      //it won't effect the final property that's why we create [newTx]
      id: DateTime.now().toString(),
      title: txTitle,
      amount: txAmount,
      //dateTime: DateTime.now(),//before it's set to default current date & time
      dateTime: chosenDate,
    );
    setState(() {
      _listTransaction.add(newTx);
      //print('new transaction button clicked = ${_listTransaction.toList()}');
    });
  }

  //to get the total amount in the list<Transaction> we nee getters get
  List<Transaction> get _getRecentTransaction {
    return _listTransaction.where((txElement) {
      return txElement.dateTime.isAfter(DateTime.now().subtract(
        const Duration(days: 7),
      ));
    }).toList();
  }

//Deriving recent transaction [startAddNewTransaction] chapter 4 ep 37
  void startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      backgroundColor: Colors.purple,
      context: ctx,
      builder: (context) {
        return GestureDetector(
          onTap: () {},
          behavior: HitTestBehavior.opaque,
          child: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.all(5),
              child: NewTransaction(
                addNewTransactionButton: _addNewTransactionButton,
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //foregroundColor: Colors.purple,
        //titleTextStyle: const TextStyle(),
        title: const Text(
          'Expense Planner',
          // style: TextStyle(
          //   color: Colors.purple,
          //   fontWeight: FontWeight.bold,
          // ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              startAddNewTransaction(context);
            },
            icon: const Icon(
              Icons.add,
              color: Colors.purple,
              //size: 40,
            ),
            //style:
            // style: ButtonStyle(
            //   textStyle: MaterialStatePropertyAll(
            //     TextStyle(
            //       fontWeight: FontWeight.bold,
            //     ),
            //   ),
            // ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              color: Colors.purple,
              width: double.infinity,
              height: 180,
              child: Chart(listTransaction: _getRecentTransaction),
            ),
            //const UserTransaction(),
            _listTransaction.isEmpty
                ? Column(
                    children: <Widget>[
                      const SizedBox(
                        width: double.infinity,
                        height: 30,
                      ),
                      const Text(
                        'You did\'nt buy any product yet!!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'KaushanScript',
                          fontWeight: FontWeight.bold,
                          color: Colors.purple,
                          fontSize: 30,
                        ),
                      ),
                      const SizedBox(
                        width: double.infinity,
                        height: 10,
                      ),
                      Container(
                        height: 300,
                        width: 300,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(5), //20
                          ),
                          border: Border.all(
                            color: Colors.purple,
                            width: 3,
                          ),
                          image: const DecorationImage(
                            image: AssetImage('assets/images/Looney_Tunes.gif'),
                            // image: AssetImage('assets/images/fuel_empty.gif'),
                            //image: AssetImage('assets/images/empty_products.png'),
                            //fit: BoxFit.cover,
                            //alignment: Alignment.center,
                          ),
                        ),
                      ),
                    ],
                  )
                : SingleChildScrollView(
                    child: TransactionList(
                        listTransaction: _listTransaction,
                        deleteTransaction: _deleteTransaction),
                  )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        width: 50,
        height: 50,
        margin: const EdgeInsets.all(20),
        child: FloatingActionButton(
          onPressed: () {
            startAddNewTransaction(context);
          },
          elevation: 10,
          shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.circular(10), //10
            side: const BorderSide(
              width: 2,
              style: BorderStyle.solid,
              color: Colors.purple,
            ),
          ),
          backgroundColor: Colors.white,
          //foregroundColor: Colors.blue,
          child: Container(
            //height: 200,
            //margin: EdgeInsets.fromLTRB(20, 20, 0, 0),
            //padding: EdgeInsets.fromLTRB(0, 0, 100, 100),
            //color: Colors.pink,
            // width: double.infinity,
            // height: double.infinity,
            alignment: Alignment.center,
            child: const Icon(
              Icons.add,
              color: Colors.purple,
              size: 30,
            ),
          ),
        ),
      ),
    );
  }
}
