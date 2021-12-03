import 'package:eb_final/models/cocktail.dart';
import 'package:flutter/material.dart';

class CocktailDetail extends StatelessWidget {
  final Cocktail cocktail;
  final String imgPath = 'https://image.tmdb.org/t/p/w500/';

  CocktailDetail(this.cocktail);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          title: Text(cocktail.strDrink!),
        ),
        body: SingleChildScrollView(
            child: Center(
                child: Column(
                  children: <Widget>[
                    Container(
                        padding: EdgeInsets.all(16),
                        height: height / 1.5,
                        child: Image.network(cocktail.strDrinkThumb!)),
                    Container(
                      padding: EdgeInsets.only(left: 16, right: 16),
                      child: Text('Categoria: ' + cocktail.strCategory! +
                                   'Instrucciones: ' + cocktail.strInstructions!),
                    )
                  ],
                ))));
  }
}