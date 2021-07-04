import 'package:flutter/material.dart';

class NoteDetails extends StatefulWidget {
  String appBarTitle;
  NoteDetails(this.appBarTitle);
  @override
  _NoteDetailsState createState() => _NoteDetailsState(this.appBarTitle);
}

class _NoteDetailsState extends State<NoteDetails> {
  String appBarTitle;
  _NoteDetailsState(this.appBarTitle);
  var _priorities = ['High', 'Low'];
  var currentItemSelected = 'High';
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.title;
    return WillPopScope(
      onWillPop: () {
        moveToLastScreen();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(appBarTitle),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              moveToLastScreen();
            },
          ),
        ),
        body: ListView(
          children: <Widget>[
            SizedBox(height: 20.0),
            DropdownButton<String>(
                items: _priorities.map((String dropDownItem) {
                  return DropdownMenuItem<String>(
                    value: dropDownItem,
                    child: Text(dropDownItem),
                  );
                }).toList(),
                style: textStyle,
                value: currentItemSelected,
                onChanged: (valueSelectedByUser) {
                  setState(() {
                    this.currentItemSelected = valueSelectedByUser;
                  });
                }),
            SizedBox(height: 20.0),
            TextField(
              keyboardType: TextInputType.text,
              style: textStyle,
              decoration: InputDecoration(
                  labelText: 'Title',
                  labelStyle: textStyle,
                  hintText: 'Enter title',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(color: Colors.green),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.yellow))),
            ),
            SizedBox(height: 20.0),
            TextField(
              keyboardType: TextInputType.text,
              style: textStyle,
              decoration: InputDecoration(
                labelText: 'Description',
                labelStyle: textStyle,
                hintText: 'Write here',
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(color: Colors.green)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.yellow)),
              ),
            ),
            SizedBox(height: 20.0),
            Row(
              children: <Widget>[
                Expanded(
                  child: RaisedButton(
                    elevation: 5.0,
                    color: Colors.blueAccent,
                    child: Text('Save', textScaleFactor: 1.5),
                    onPressed: () {},
                  ),
                ),
                SizedBox(width: 10.0),
                Expanded(
                  child: RaisedButton(
                    elevation: 5.0,
                    color: Colors.blueAccent,
                    child: Text('Delete', textScaleFactor: 1.5),
                    onPressed: () {},
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void moveToLastScreen() {
    Navigator.pop(context);
  }
}
