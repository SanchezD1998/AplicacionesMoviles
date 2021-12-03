import 'package:flutter/material.dart';
import 'package:happymeals/helper/repository.dart';

import '../model/category.dart';
import '../ui/plates_list.dart';

class PlatesListScreen extends StatelessWidget {
  static const routeName = 'plates-list';
  final _repository = Repository();

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context).settings.arguments as String;
    return Center(
      child: FutureBuilder<CategoryList>(
        future: _repository.fetchCategories(category),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<CategoriesItem> categories = snapshot.data.categoriesItem;
            int lenght = categories.length;
            return Scaffold(
              appBar: AppBar(
                title: Text("Lista de platos"),
              ),
              body: ListView(
                children: [
                  for (int i = 0; i < lenght; i++)
                    PlatesList(
                      repository: _repository,
                      title: categories[i].strMeal,
                    ),
                ],
              ),
              // bottomNavigationBar: navigationBar(),
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
