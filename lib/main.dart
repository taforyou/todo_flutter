import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  new MaterialApp(
      title: 'To Do App',
      home: new ToDoList(),
    );
  }
}

class ToDoListState extends State<ToDoList> {
 final _activities = new List<String>.generate(10000, (i) => "Item $i");

 @override
  Widget build(BuildContext context) {
    return new Scaffold (
      appBar: new AppBar(
        title: new Text('To Do List'),
      ),
      body: _buildToDoLists(),
    );
  }

  Widget _buildToDoLists() {
    return new ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder:  (context, i) {
        if (i.isOdd) return new Divider();
        final index = i ~/2;
        if (index >= _activities.length) {
          return _buildRow(_activities[index]);
        }
      },
    );
  }
  Widget _buildRow(String pair) {
    return new ListTile(
      title: new Text(
        pair,
        style: const TextStyle(fontSize: 18.0),
      ),
    );
  }
}

class ToDoList extends StatefulWidget {
  @override
    State<StatefulWidget> createState() {
      // TODO: implement createState
      new ToDoListState();
    }
}
