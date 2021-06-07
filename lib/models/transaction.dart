//import 'package:flutter/foundation.dart';

class Transaction {
  final String id;
  final String title;
  final double amount;
  final DateTime date;

  Transaction({
    required this.id,  //@required = required is not working in my enviroment
    required this.title,
    required this.amount,
    required this.date,
  });
}
