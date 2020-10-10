import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NewTransection extends StatefulWidget {
  final Function addTx;
  NewTransection(this.addTx);

  @override
  _NewTransectionState createState() => _NewTransectionState();
}

class _NewTransectionState extends State<NewTransection> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submittedDate() {
    final title = titleController.text;
    final amount = double.parse(amountController.text);
    if (title.isEmpty || amount <= 0) {
      return;
    }
    widget.addTx(title, amount);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'Enter Title'),
            ),
            TextField(
                controller: amountController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => submittedDate(),
                decoration: InputDecoration(labelText: 'Enter Amount')),
            FlatButton(
              child: Text('Add Transiction'),
              onPressed: () => submittedDate(),
              textColor: Colors.deepPurple,
            )
          ],
        ),
      ),
    );
  }
}
