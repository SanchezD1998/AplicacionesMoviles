import 'dart:async';
import 'package:happymeals/model/category.dart';
import 'package:happymeals/model/category_model.dart';
import 'package:http/http.dart' show Client, Response;
import 'dart:convert';
import '../model/plates.dart';
import 'dart:developer';

class happymeal_api {
  Client client = Client();

  final String _homemadeUrl = 'https://homemade-api-tf.herokuapp.com/api';
  final String _baseUrl = 'https://www.themealdb.com/api/json/v1/1';

  Future<Plates> fetchMeals(String type) async {
    Response response;
    response = await client.get("$_baseUrl/filter.php?c=$type");
    if (response.statusCode == 200) {
      return Plates.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load list meals');
    }
  }

  Future<Plates> fetchDetail(String id) async {
    Response response;
    response = await client.get("$_baseUrl/lookup.php?i=$id");
    if (response.statusCode == 200) {
      return Plates.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load detail meals');
    }
  }

  Future<Plates> searchMeals(String name) async {
    final response = await client.get("$_baseUrl/search.php?s=$name");
    if (response.statusCode == 200) {
      return Plates.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load $name meals');
    }
  }

  Future<Plates> randomMeals() async {
    final response = await client.get("$_baseUrl/random.php");
    if (response.statusCode == 200) {
      return Plates.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load detail meals');
    }
  }

  Future<CategoryModel> searchCategories() async {
    Response response;
    response = await client.get("$_baseUrl/categories.php");
    log(response.body);
    if (response.statusCode == 200) {
      return CategoryModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load category of meals');
    }
  }

  Future<CategoryList> fetchCategories(String category) async {
    Response response;
    response = await client.get("$_baseUrl/filter.php?c=$category");
    if (response.statusCode == 200) {
      return CategoryList.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load list of $category meals');
    }
  }

  Future<Plates> getRecipe(int id) async{
    final response = await client.get("$_baseUrl/random.php");
    if (response.statusCode == 200) {
      log(response.body);
      return Plates.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load detail meals');
    }
  }
}
