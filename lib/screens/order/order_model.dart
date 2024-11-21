import 'package:foodmarket/screens/home/food_model.dart';

class OrderModel {
  FoodModel foodModel;
  int qty;
  String status;
  DateTime dateTime;

  OrderModel(this.foodModel, this.qty, this.dateTime, this.status);
}

List<OrderModel> orders = [
  OrderModel(foods[2], 2, DateTime(2024, 11, 20, 16, 08, 01), 'pastOrder'),
  OrderModel(foods[1], 1, DateTime(2024, 11, 20, 20, 31, 10), 'inProgress'),
  OrderModel(foods[4], 4, DateTime(2024, 11, 21, 08, 19, 20), 'inProgress'),
];
