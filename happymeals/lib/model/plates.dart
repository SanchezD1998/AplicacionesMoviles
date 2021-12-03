class Plates {
  List<Meals> meals;

  Plates({this.meals});

  Plates.fromJson(Map<String, dynamic> json) {
    if (json['meals'] != null) {
      meals = new List<Meals>();
      json['meals'].forEach((v) {
        meals.add(new Meals.fromJson(v));
      });
    }
  }
}

class Meals {
  String idMeal;
  String strMeal;
  String strCategory;
  String strInstructions;
  String strMealThumb;
  String type;

  Meals(
      {this.idMeal,
        this.strMeal,
        this.strCategory,
        this.strInstructions,
        this.strMealThumb,
        this.type});

  Meals.fromJson(Map<String, dynamic> json) {
    idMeal = json['idMeal'];
    strMeal = json['strMeal'];
    strCategory = json['strCategory'];
    strInstructions = json['strInstructions'];
    strMealThumb = json['strMealThumb'];
    type = json['type'];
  }
}
