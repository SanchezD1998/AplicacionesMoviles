import 'package:flutter/material.dart';

import 'UI/cocktail_list.dart';

void main() {
  runApp(MyCocktails());
}

class MyCocktails extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My Cocktails",
      theme: ThemeData(
        primarySwatch: Colors.deepPurple
      ),
      home: CocktailList(),
    );
  }
}



