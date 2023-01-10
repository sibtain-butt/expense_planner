import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addNewTransactionButton;

  NewTransaction({Key? key, required this.addNewTransactionButton})
      : super(key: key);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final TextEditingController titleTextEditingController =
      TextEditingController();
  final TextEditingController amountTextEditingController =
      TextEditingController();
  DateTime? selectedDate;
  // the above statement is equal to the initializer like below statement
  // DateTime selectedDate = null; ? Question mark is equal to null initializer

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Card(
          elevation: 5,
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  color: Colors.purple,
                  child: Text(
                    'Create New Transaction',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      // decoration: TextDecoration.underline,
                      fontFamily: 'KaushanScript',
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                ),
                const SizedBox(
                  width: double.infinity,
                  height: 20, //30 default value
                ),
                TextField(
                  cursorColor: Colors.purple,
                  keyboardType: TextInputType.name,
                  //(_) UnderScore means when we don't want to use (default)value
                  // and we also need to use anonymous () function ()=> submitData
                  //we can't use submitData() ... we just need to give/pass pointer
                  onSubmitted: (_) => submitData,
                  controller: titleTextEditingController,
                  textAlignVertical: TextAlignVertical.center,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.purple,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'KaushanScript',
                  ),
                  decoration: InputDecoration(
                    alignLabelWithHint: true,
                    floatingLabelAlignment: FloatingLabelAlignment.center,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.purple.shade200,
                        width: 2,
                        style: BorderStyle.solid,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.purple,
                        width: 2,
                        style: BorderStyle.solid,
                      ),
                    ),
                    hintText: 'Name of your product',
                    label: Text(
                      textAlign: TextAlign.center,
                      'Title',
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    labelStyle: TextStyle(
                      color: Colors.purple,
                      fontFamily: 'KaushanScript',
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // onChanged: (value) {
                  //   titleInput = value;
                  // },
                ),
                const SizedBox(
                  width: double.infinity,
                  height: 20, //30 default value
                ),
                TextField(
                  textAlignVertical: TextAlignVertical.center,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.purple,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'KaushanScript',
                  ),
                  cursorColor: Colors.purple,
                  keyboardType: TextInputType.number,
                  controller: amountTextEditingController,
                  onSubmitted: (_) => submitData,
                  decoration: InputDecoration(
                    alignLabelWithHint: true,
                    floatingLabelAlignment: FloatingLabelAlignment.center,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.purple.shade200,
                        width: 2,
                        style: BorderStyle.solid,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.purple,
                        width: 2,
                        style: BorderStyle.solid,
                      ),
                    ),
                    hintText: 'Price of your product',
                    filled: true,
                    fillColor: Colors.white,
                    labelText: 'Amount',
                    labelStyle: TextStyle(
                      color: Colors.purple,
                      fontFamily: 'KaushanScript',
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // onChanged: (value) => amountInput = value
                  // amountInput = value;
                ),
                const SizedBox(
                  width: double.infinity,
                  height: 10, // 30 default value
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      selectedDate == null
                          ? 'You did\'nt select any date'
                          : 'Date Selected: ${DateFormat.yMMMEd().format(selectedDate!)}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'KaushanScript',
                        fontWeight: FontWeight.bold,
                        color: Colors.purple,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(width: 30
                        // height: double.infinity,//render overflowed by infinity
                        ),
                    MaterialButton(
                      onPressed: presentDatePicker,
                      //height: 50,
                      splashColor: Colors.purple.shade200,
                      textColor: Colors.purple,
                      elevation: 5,
                      shape: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                        borderSide: BorderSide(
                          color: Colors.purple,
                          style: BorderStyle.solid,
                          width: 2,
                        ),
                      ),
                      child: Text(
                        'Choose date',
                        style: TextStyle(
                          fontFamily: 'KaushanScript',
                          fontWeight: FontWeight.bold,
                          color: Colors.purple,
                          fontSize: 20, // 30 default value
                        ),
                      ),
                    ),
                  ],
                ),
                //DateTimePickerButton

                const SizedBox(
                  width: double.infinity,
                  height: 20,
                ),
                MaterialButton(
                  onPressed: () {
                    // print('titleInput  ${titleInput}');
                    // print('amountInput  ${amountInput}');
                    // print('titleInput  ${titleTextEditingController.text}');
                    // print('amountInput  ${amountTextEditingController.text}');
                    submitData(context);
                    // i use Ctrl+Alt+M to create Method as [submitData()]
                    // addNewTransactionButton(
                    //   titleTextEditingController.text,
                    //   double.parse(amountTextEditingController.text),
                    // );
                  },
                  height: 50,
                  splashColor: Colors.purple.shade200,
                  textColor: Colors.purple,
                  elevation: 5,
                  shape: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                    borderSide: BorderSide(
                      color: Colors.purple,
                      style: BorderStyle.solid,
                      width: 2,
                    ),
                  ),
                  child: Text(
                    'Add to list',
                    style: TextStyle(
                      fontFamily: 'KaushanScript',
                      fontWeight: FontWeight.bold,
                      color: Colors.purple,
                      fontSize: 30,
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  void presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2009),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        selectedDate = pickedDate;
      });
    });
  }

  void submitData(BuildContext context) {
    if (amountTextEditingController.text.isEmpty) {
      return;
    }
    final String enteredTitle = titleTextEditingController.text;
    final double enteredAmount = double.parse(amountTextEditingController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0 || selectedDate == null) {
      return;
    }

    widget.addNewTransactionButton(
      enteredTitle,
      enteredAmount,
      selectedDate,
    );
    Navigator.of(context).pop();
  }
}
