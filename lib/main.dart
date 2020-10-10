import 'package:flutter/material.dart';
import 'package:flutter_complete_guide_2/widget/new_transection.dart';
import 'package:flutter_complete_guide_2/widget/transection_list.dart';
import 'Models/transection.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'My Second App', home: MyAppHomePage());
  }
}

class MyAppHomePage extends StatefulWidget {
  @override
  _MyAppHomePageState createState() => _MyAppHomePageState();
}

class _MyAppHomePageState extends State<MyAppHomePage> {
  final List<Transection> _userTransection = [
    Transection(id: 't1', amount: 1080, date: DateTime.now(), title: 'hello'),
    Transection(id: 't2', amount: 165, date: DateTime.now(), title: 'hi'),
    Transection(id: 't3', amount: 3635, date: DateTime.now(), title: 'five'),
    Transection(id: 't4', amount: 9853, date: DateTime.now(), title: 'cool'),
  ];

  void _addTransection(String title, double amount) {
    final newTx = Transection(
        id: DateTime.now().toString(),
        title: title,
        amount: amount,
        date: DateTime.now());

    setState(() {
      _userTransection.add(newTx);
    });
  }

  void _startAddNewTransection(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return NewTransection(_addTransection);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Second App title'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _startAddNewTransection(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: double.infinity,
              child: Card(
                color: Colors.blue,
                child: Text('Chart'),
                elevation: 5,
              ),
            ),
            TransectionList(_userTransection),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTransection(context),
      ),
    );
  }
}
