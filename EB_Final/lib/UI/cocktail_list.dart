import 'package:eb_final/models/cocktail.dart';
import 'package:eb_final/utils/http_helper.dart';
import 'package:flutter/material.dart';

import 'cocktail_detail.dart';

class CocktailList extends StatefulWidget {
  @override
  CocktailListState createState() => CocktailListState();
}

class CocktailListState extends State<CocktailList> {
  late String result;
  late HttpHelper helper;
  int cocktailCount=0;
  List<Cocktail> cocktails=[];
  var name = TextEditingController();
  Icon visibleIcon = Icon(Icons.search);
  Widget searchBar = Text('Cocktails');

  @override
  void initState() {
    helper = HttpHelper();
    initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: searchBar, actions: <Widget>[
          IconButton(
            icon: visibleIcon,
            onPressed: () {
              setState(() {
                if (this.visibleIcon.icon == Icons.search) {
                  this.visibleIcon = Icon(Icons.cancel);
                  this.searchBar = TextField(
                    textInputAction: TextInputAction.search,
                    onSubmitted: (String text) {
                      search(text:text);
                    },
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  );
                } else {
                  setState(() {
                    this.visibleIcon = Icon(Icons.search);
                    this.searchBar = Text('Cocteles!!');
                  });
                }
              });
            },
          ),
        ]),
        body:Column(
          children: [
            Container(
              height: 50,
              width: double.infinity,
              child: TextField(
                onSubmitted: (text) {
                  search(text: text);
                  print(text);
                },
                controller: name,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  filled: true,
                  hintText: 'Filtrar por nombre',
                  fillColor: Colors.white,
                ),
              ),
            ),
            ListView.builder(
                itemCount: (this.cocktailCount == null) ? 0 : this.cocktailCount,
                itemBuilder: (BuildContext context, int position) {
                  return Card(
                      color: Colors.white,
                      elevation: 4.0,
                      child: ListTile(
                        onTap: () {
                          MaterialPageRoute route = MaterialPageRoute(
                              builder: (_) => CocktailDetail(cocktails[position]));
                          Navigator.push(context, route);
                        },
                        leading: Image.network(cocktails[position].strDrinkThumb!),
                        title: Text(cocktails[position].strDrink!),
                        subtitle: Text('Categoria: ' + cocktails[position].strCategory.toString()),
                      ));
                })
          ],
        )
        );
  }

  void search({required text}) async {
    cocktails = await helper.findCocktailByName(text);
    setState(() {
      cocktailCount = cocktails.length;
      cocktails = cocktails;
    });
  }
  Future initialize() async {
    cocktails = await helper.findCocktailByName("");
    setState(() {
      cocktailCount = cocktails.length;
      cocktails = cocktails;
    });
  }
}