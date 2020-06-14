import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: 'Title',
              ),
              //onChanged: (val) => {titleInput = val},
              controller: titleController,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Amount',
              ),
              controller: amountController,
              //onChanged: (val) => {amountInput = val},
            ),
            FlatButton(
              textColor: Colors.purple,
              onPressed: () {
                print(titleController.text);
                print(amountController.text);
              },
              child: Text(
                'Add Transaction',
              ),
            )
          ],
        ),
      ),
    );
  }
}