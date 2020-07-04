import 'package:expense_manager/widget/chart_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../model/transaction.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;
  Chart(this.recentTransactions);

  List<Map<String, Object>> get groupedTransactionsValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double totalSum = 0;

      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year) {
          totalSum += recentTransactions[i].amount;
        }
      }

      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalSum
      };
    });
  }

  double _totalSpending() {
    double totalAmt = 0;
    for (var i = 0; i < groupedTransactionsValues.length; i++) {
      totalAmt += groupedTransactionsValues[i]['amount'];
    }
    print('here');
    print(totalAmt);
    return totalAmt;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(
        children: groupedTransactionsValues.map((data) {
          return ChartBar(
              data['day'],
              data['amount'],
              _totalSpending() == 0
                  ? 0.0
                  : (data['amount'] as double) / _totalSpending());
        }).toList(),
      ),
    );
  }
}
