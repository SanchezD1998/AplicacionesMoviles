import 'package:flutter/material.dart';
import 'package:happymeals/screens/categorylist_screen.dart';
import 'package:happymeals/screens/plateslist_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Homemade App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Montserrat'),
      // home: TabsScreen(),
      initialRoute: '/',
      routes: {
        '/': (ctx) => CategoryListScreen(),
        CategoryListScreen.routeName: (ctx) => CategoryListScreen(),
        PlatesListScreen.routeName: (ctx) => PlatesListScreen(),
      },
    );
  }
}
