import 'package:flutter/material.dart';
import 'package:happymeals/helper/repository.dart';
import 'package:happymeals/ui/category_list.dart';



class CategoryListScreen extends StatelessWidget {
  static const routeName = '/category';
  final _repository = Repository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de categorias"),
      ),
      body: CategoryList(repository: _repository
      ),
    );
  }
}
