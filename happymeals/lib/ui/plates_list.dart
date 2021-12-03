import 'package:flutter/material.dart';
import 'package:happymeals/helper/repository.dart';
import 'package:happymeals/model/plates.dart';
import '../model/category_model.dart';

class PlatesList extends StatelessWidget {
  const PlatesList({
    Key key,
    @required String title,
    @required Repository repository,
  })  : _repository = repository,
        _title = title,
        super(key: key);

  final Repository _repository;
  final String _title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<Plates>(
        future: _repository.searchMeals(_title),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Meals> newItem = snapshot.data.meals;

            return GestureDetector(
              child: Container(

                height: 220,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Container(
                      child: Image.network(
                        '${newItem[0].strMealThumb}',
                        height: 120,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text(
                      '${newItem[0].strMeal}',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Quicksand',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
