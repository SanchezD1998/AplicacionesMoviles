import 'package:flutter/material.dart';

void main() {
  runApp(MyStatefulApp());
}
/*
class MyStatelessApp extends StatelessWidget {

  int counter=0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Ejemplo de StatelessWidget"),
        ),
        body: Center(
          child: Text(counter.toString())
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.plus_one),
          onPressed: (){
            counter++;
            print(counter);
          },
        ),
      )
    );
  }
}*/

class MyStatefulApp extends StatefulWidget {
  @override
  _MyStatefulAppState createState() => _MyStatefulAppState();
}

class _MyStatefulAppState extends State<MyStatefulApp> {
  int counter=0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text("Ejemplo de StatelessWidget"),
          ),
          body: Center(
              child: Text(counter.toString(),
              style: TextStyle(fontSize: 80),)
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.plus_one),
            onPressed: (){
              counter++;
              print(counter);
              setState(() {

              });
            },
          ),
        )
    );
  }
}

