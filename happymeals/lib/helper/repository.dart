import 'dart:async';
import 'package:happymeals/model/category.dart';
import 'package:happymeals/model/category_model.dart';
import 'package:happymeals/model/plates.dart';

import 'happymeal_api.dart';

class Repository {
  final happymealApi = happymeal_api();

  Future<Plates> fetchAllMeals(String type) => happymealApi.fetchMeals(type);

  Future<Plates> fetchDetailMeals(int id) => happymealApi.fetchDetail(id.toString());

  Future<Plates> searchMeals(String name) => happymealApi.searchMeals(name);


  Future<CategoryModel> searchCategories() => happymealApi.searchCategories();

  Future<CategoryList> fetchCategories(String category) => happymealApi.fetchCategories(category);
}
