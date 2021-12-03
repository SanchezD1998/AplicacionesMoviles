import 'package:eb_final/models/cocktail.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

class HttpHelper {

  final String urlSearchBase = 'https://www.thecocktaildb.com/api/json/v1/1/search.php?s=';

  Future<List<Cocktail>> findCocktail(String title) async {
    final String query = urlSearchBase + title ;
    http.Response result = await http.get(Uri.parse(query));
    if (result.statusCode == HttpStatus.ok) {
      final jsonResponse = json.decode(result.body);
      final cocktailsMap = jsonResponse['drinks'];
      List<Cocktail> cocktails = cocktailsMap.map((i) => Cocktail.fromJson(i)).toList();
      return cocktails;
    }
    else {
      return null!;
    }  }

  Future<List<Cocktail>> findCocktailByName(String name) async{
    var response = await http.get(Uri.parse('https://www.thecocktaildb.com/api/json/v1/1/search.php?s=$name%27'));
        var drinks = json.decode(response.body)["drinks"];
        var information = drinks as List;
        return information.map((e) => Cocktail.fromJson(e)).toList();
  }
}