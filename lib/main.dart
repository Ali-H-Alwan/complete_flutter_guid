import 'package:flutter/material.dart';
import 'package:flutter_complete_guide_2/widget/Chart.dart';
import 'package:flutter_complete_guide_2/widget/new_transection.dart';
import 'package:flutter_complete_guide_2/widget/transection_list.dart';
import 'Models/transection.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'My Second App',
        theme: ThemeData(
            primarySwatch: Colors.green,
            accentColor: Colors.lightGreen,
            fontFamily: 'QuickSand',
            textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(
                    fontFamily: 'OpenSens',
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
                button: TextStyle(color: Colors.white)),
            appBarTheme: AppBarTheme(
              textTheme: ThemeData.light().textTheme.copyWith(
                  title: TextStyle(
                      fontFamily: 'OpenSens',
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
            )),
        home: MyAppHomePage());
  }
}

class MyAppHomePage extends StatefulWidget {
  @override
  _MyAppHomePageState createState() => _MyAppHomePageState();
}

class _MyAppHomePageState extends State<MyAppHomePage> {
  final List<Transection> _userTransection = [
    // Transection(id: 't1', amount: 1080, date: DateTime.now(), title: 'hello'),
    // Transection(id: 't2', amount: 165, date: DateTime.now(), title: 'hi'),
    // Transection(id: 't3', amount: 3635, date: DateTime.now(), title: 'five'),
    // Transection(id: 't4', amount: 9853, date: DateTime.now(), title: 'cool'),
    // Transection(id: 't4', amount: 9852, date: DateTime.now(), title: 'cool'),
    // Transection(id: 't4', amount: 9851, date: DateTime.now(), title: 'cool'),
  ];

  List<Transection> get _recentTransection {
    return _userTransection.where((element) {
      return element.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  void _addTransection(String title, double amount, DateTime selectedDate) {
    final newTx = Transection(
        id: DateTime.now().toString(),
        title: title,
        amount: amount,
        date: selectedDate);

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
            Chart(_recentTransection),
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
