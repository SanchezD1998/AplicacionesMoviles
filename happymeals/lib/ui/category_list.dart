import 'package:flutter/material.dart';
import 'package:happymeals/helper/repository.dart';

import '../model/category_model.dart';
import '../screens/plateslist_screen.dart';

//Lista de categorías

class CategoryList extends StatelessWidget {
  CategoryList({
    Key key,
    @required Repository repository,
  })  : _repository = repository,
        super(key: key);

  final Repository _repository;


  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<CategoryModel>(
          future: _repository.searchCategories(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Category> newCategory = snapshot.data.categories;
              int length = newCategory.length;
              return GridView.count(
                crossAxisSpacing: 10,
                mainAxisSpacing: 14,
                childAspectRatio: 3 / 2,
                crossAxisCount: 2,
                children: List.generate(length, (index) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(
                          PlatesListScreen.routeName,
                          arguments: newCategory[index].strCategory);
                    },
                    child: Card(
                      elevation: 4,
                      margin: EdgeInsets.all(10),
                      child: Column(
                        children: <Widget>[
                          Stack(
                            children: <Widget>[
                              Text('${newCategory[index].strCategory}'),
                              ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  topRight: Radius.circular(15),
                                ),
                                child: Image.network(
                                  '${newCategory[index].strCategoryThumb}',
                                  height: 100,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                }),
              );
            }
            return CircularProgressIndicator();
          }),
    );
  }
}