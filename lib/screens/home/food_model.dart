class FoodModel {
  String image;
  String name;
  String price;
  double rating;

  FoodModel(this.image, this.name, this.price, this.rating);
}

List<FoodModel> foods = [
  FoodModel('assets/soup.png', 'Soup Bumil', 'IDR 30.000', 5),
  FoodModel('assets/chicken.png', 'Chicken', 'IDR 29.000', 3),
  FoodModel('assets/shrimp.png', 'Shrimp', 'IDR 50.000', 4),
  FoodModel('assets/es-tongtong.png', 'Es Krim', 'IDR 9.000', 4),
  FoodModel('assets/salad.png', 'Salad', 'IDR 6.000', 4),
];
