import 'package:flutter/material.dart';
import '../Models/transection.dart';
import 'package:intl/intl.dart';

class TransectionList extends StatelessWidget {
  final List<Transection> userTransection;
  TransectionList(this.userTransection);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: userTransection.isEmpty
          ? Column(children: <Widget>[
              Text('No transction added yet',
                  style: Theme.of(context).textTheme.headline6),
              SizedBox(height: 20),
              Container(
                height: 200,
                child: Image.asset(
                  'assets/images/waiting.png',
                  fit: BoxFit.cover,
                ),
              )
            ])
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 4,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                          padding: EdgeInsets.all(6),
                          child: FittedBox(
                              child:
                                  Text('\$${userTransection[index].amount}'))),
                    ),
                    title: Text(
                      userTransection[index].title,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    subtitle: Text(
                      DateFormat.yMMMd().format(userTransection[index].date),
                    ),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.delete,
                        color: Theme.of(context).errorColor,
                      ),
                      onPressed: () {},
                    ),
                  ),
                );
              },
              itemCount: userTransection.length,
            ),
    );
  }
}
