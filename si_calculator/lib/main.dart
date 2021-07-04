import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Calculator(),
        theme: ThemeData(
            brightness: Brightness.dark,
            primaryColor: Colors.indigo,
            accentColor: Colors.indigoAccent),
      ),
    );

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  var _currencies = ['Rupees', 'Dollars', 'Pounds', 'Euro'];
  var _currentItemSelected = 'Rupees';
  TextEditingController principleController = TextEditingController();
  TextEditingController roiController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  var displayResult = '';
  var _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.title;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Simple Interest Calculator',
          style: TextStyle(letterSpacing: 0.5),
        ),
        backgroundColor: Colors.indigo,
      ),
      //backgroundColor: Colors.black,
      body: Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20.0),
            ),
            Container(
              padding: EdgeInsets.only(left: 15.0),
              child: Image(
                image: AssetImage('images/money.jpg'),
                height: 150.0,
                width: 150.0,
              ),
            ),
            SizedBox(height: 20.0),
            TextFormField(
              style: textStyle,
              keyboardType: TextInputType.number,
              validator: (String value) {
                if (value.isEmpty)
                  return 'Please enter a valid principle amount';
                // else if (value != TextInputType.number) return 'Invalid Input';
              },
              controller: principleController,
              decoration: InputDecoration(
                  labelText: 'Principle',
                  hintText: 'Enter Principle, eg:250.5',
                  errorStyle:
                      TextStyle(color: Colors.yellowAccent, fontSize: 20.0),
                  labelStyle: textStyle,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  )),
            ),
            SizedBox(height: 5.0),
            TextFormField(
              style: textStyle,
              keyboardType: TextInputType.number,
              validator: (String value) {
                if (value.isEmpty)
                  return 'Please enter the valid rate of interest';
                //else if (value != TextInputType.number) return 'Invalid Input';
              },
              controller: roiController,
              decoration: InputDecoration(
                  labelText: 'Interest',
                  labelStyle: textStyle,
                  hintText: 'Enter rate of interest',
                  errorStyle:
                      TextStyle(fontSize: 20.0, color: Colors.yellowAccent),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  )),
            ),
            SizedBox(height: 5.0),
            Row(
              children: <Widget>[
                Expanded(
                  child: TextFormField(
                    style: textStyle,
                    keyboardType: TextInputType.number,
                    validator: (String value) {
                      if (value.isEmpty) return 'Please enter valid time';
                      // else if (value != TextInputType.number)
                      // return 'Invalid Input';
                    },
                    controller: timeController,
                    decoration: InputDecoration(
                      labelStyle: textStyle,
                      errorStyle:
                          TextStyle(fontSize: 20.0, color: Colors.yellowAccent),
                      labelText: 'Time',
                      hintText: 'Enter time in years',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10.0),
                Expanded(
                  child: DropdownButton<String>(
                    style: textStyle,
                    items: _currencies.map((String dropDownStringItem) {
                      return DropdownMenuItem<String>(
                        value: dropDownStringItem,
                        child: Text(dropDownStringItem),
                      );
                    }).toList(),
                    value: _currentItemSelected,
                    onChanged: (String newValueSelected) {
                      setState(() {
                        this._currentItemSelected = newValueSelected;
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 5.0),
            Row(
              children: <Widget>[
                Expanded(
                  child: RaisedButton(
                    color: Theme.of(context).accentColor,
                    child: Text(
                      'Calculate',
                      style: TextStyle(fontSize: 20.0),
                    ),
                    onPressed: () {
                      setState(() {
                        if (_formKey.currentState.validate())
                          this.displayResult = calculateTotalReturns();
                      });
                    },
                  ),
                ),
                SizedBox(width: 10.0),
                Expanded(
                  child: RaisedButton(
                    color: Theme.of(context).primaryColorDark,
                    child: Text(
                      'Reset',
                      style: TextStyle(fontSize: 20.0),
                    ),
                    onPressed: () {
                      setState(() {
                        reset();
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 5.0),
            Text(
              displayResult,
              style: TextStyle(fontSize: 20.0, color: Colors.yellow),
            ),
          ],
        ),
      ),
    );
  }

  String calculateTotalReturns() {
    double principle = double.parse(principleController.text);
    double roi = double.parse(roiController.text);
    double time = double.parse(timeController.text);
    double totalAmountPayable = principle + (principle * roi * time) / 100;
    String result =
        'After $time years total payable amount is $totalAmountPayable $_currentItemSelected';
    return result;
  }

  void reset() {
    principleController.text = '';
    roiController.text = '';
    timeController.text = '';
    displayResult = '';
    _currentItemSelected = _currencies[0];
  }
}
