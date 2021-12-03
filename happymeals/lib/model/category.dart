class CategoryList {
  List<CategoriesItem> categoriesItem;

  CategoryList({this.categoriesItem});

  CategoryList.fromJson(Map<String, dynamic> json) {
    if (json['meals'] != null) {
      categoriesItem = new List<CategoriesItem>();
      json['meals'].forEach((v) {
        categoriesItem.add(new CategoriesItem.fromJson(v));
      });
    }
  }
}

class CategoriesItem {
  String strMeal;
  String strMealThumb;
  String idMeal;

  CategoriesItem({
    this.strMeal,
    this.strMealThumb,
    this.idMeal,
  });

  CategoriesItem.fromJson(Map<String, dynamic> json) {
    strMeal = json['strMeal'];
    strMealThumb = json['strMealThumb'];
    idMeal = json['idMeal'];
  }
}
