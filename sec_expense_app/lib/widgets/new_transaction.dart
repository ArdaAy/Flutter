import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget{
  
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  DateTime _selectedDate;

  void _submitData(){
    if(amountController.text.isEmpty){
      return;
    }
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if(enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null){
      return;
    }

    widget.addTx(
      enteredTitle, 
      enteredAmount,
      _selectedDate
    );
    // Nasıl olduğunu anlamadım
    // ama klavyeyi kapatıyor
    Navigator.of(context).pop();
  }

  void _presentDatePicker(){
    showDatePicker(
      context: context, 
      initialDate: DateTime.now(), 
      firstDate: DateTime(2020), 
      lastDate: DateTime.now(),
      ).then((value) {
        if(value == null){
          return;
        }
        setState(() {
          _selectedDate = value;
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: SingleChildScrollView(
              child: Card(
              elevation: 5,
              child: Container(
                padding: EdgeInsets.only(
                  top: 10, 
                  left: 10, 
                  right: 10, 
                  bottom: MediaQuery.of(context).viewInsets.bottom +100,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    TextField(
                      controller: titleController,
                      decoration: InputDecoration(
                        labelText: 'Title',
                      ),
                      onSubmitted: (_) => _submitData(),
                      //onChanged: (val) => titleInput = val,
                    ),
                    TextField(
                      keyboardType: TextInputType.number,
                      controller: amountController,
                      decoration: InputDecoration(
                        labelText: 'Amount',
                      ),
                      onSubmitted: (_) => _submitData(),
                      //onChanged: (val) => amountInput = val,
                    ),
                    Container(
                      height: 70,
                      child: Row(
                        children: <Widget>[
                          Expanded(child: Text(_selectedDate == null ? 'No Date Chosen!' : 'Picket Date: ${DateFormat.yMd().format(_selectedDate)}')),
                          FlatButton(
                            textColor: Theme.of(context).primaryColor,
                            onPressed: _presentDatePicker, 
                            child: Text(
                              'Choose Date',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                             )
                          )
                        ],
                      ),
                    ),
                    RaisedButton(
                      child: Text('Add Transaction'),
                      textColor: Theme.of(context).textTheme.button.color,
                      onPressed: _submitData,
                      color: Theme.of(context).primaryColor,
                    ),
                  ],
                ),
              ),
            ),
      ),
    );
  }
}