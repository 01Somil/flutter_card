import 'package:flutter/material.dart';
import 'package:notekeeper_app/screens/note_detail.dart';

class NoteList extends StatefulWidget {
  @override
  _NoteListState createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes'),
      ),
      body: getNoteListView(),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add note',
        child: Icon(Icons.add),
        onPressed: () {
          navigateToList('Add Note');
        },
      ),
    );
  }

  ListView getNoteListView() {
    TextStyle titleStyle = Theme.of(context).textTheme.subhead;
    return ListView.builder(
        itemCount: count,
        itemBuilder: (BuildContext context, int position) {
          return Card(
            color: Colors.white,
            elevation: 3.0,
            child: ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.arrow_right),
                backgroundColor: Colors.yellow,
              ),
              title: Text('Dummy Title'),
              subtitle: Text('Dummy Subtitle'),
              trailing: Icon(Icons.delete),
              onTap: () {
                navigateToList('Edit Note');
              },
            ),
          );
        });
  }

  void navigateToList(String title) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return NoteDetails(title);
    }));
  }
}
