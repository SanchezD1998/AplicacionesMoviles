import 'package:flutter/material.dart';
import 'package:app_persistencia_sqflite/util/dbhelper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DbHelper helper = DbHelper();
    helper.testDB();

    return MaterialApp(
      title: "Lista de compras",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Container(

      ),
    );
  }
}

