import 'package:flutter/material.dart';
import 'package:app_persistencia_sqflite/util/dbhelper.dart';
import 'package:app_persistencia_sqflite/models/shopping_list.dart';
import 'package:app_persistencia_sqflite/models/list_items.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //DbHelper helper = DbHelper();
    //helper.testDB();
    return MaterialApp(
      title: "Lista de compras",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text("My shopping list!!!"),
        ),
        body: ShowList(),
      ),
    );
  }
}

class ShowList extends StatefulWidget {
  @override
  _ShowListState createState() => _ShowListState();
}

class _ShowListState extends State<ShowList> {
  DbHelper helper = DbHelper();
  List<ShoppingList> shoppingList=[];
  @override
  Widget build(BuildContext context) {
    showData();
    return ListView.builder(
        itemCount: (shoppingList != null)? shoppingList.length : 0,
          itemBuilder:(BuildContext context, int index){
          return ListTile(
            title: Text(shoppingList[index].name),
            leading: CircleAvatar(
              child: Text(shoppingList[index].priority.toString()),
            ),
            trailing: IconButton(
              icon: Icon(Icons.edit),
              onPressed: (){

              },
            ),
          );
        }
    );
  }

  Future showData() async{
    await helper.openDb();
    shoppingList = await helper.getLists();
    setState(() {
      shoppingList = shoppingList;
    });
  }
}

