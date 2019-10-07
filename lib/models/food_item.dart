import 'package:flutter/foundation.dart';

FooditemList fooditemList = FooditemList(foodItems: [
  FoodItem(
    id: 1,
    title: "Chicken Tikka",
    description: "Purani dilli flavor",
    ratings: 2.5,
    price: 14.49,
    imgUrl:
        "https://hips.hearstapps.com/pop.h-cdn.co/assets/cm/15/05/480x240/54ca71fb94ad3_-_5summer_skills_burger_470_0808-de.jpg",
  ),
  FoodItem(
    id: 2,
    title: "Chicken Roasted",
    description: "Old Delhi special",
    ratings: 5.0,
    price: 11.99,
    imgUrl:
        "https://b.zmtcdn.com/data/pictures/chains/8/18427868/1269c190ab2f272599f8f08bc152974b.png",
  ),
  FoodItem(
    id: 3,
    title: "Chicken Shawarma",
    description: "Indian",
    ratings: 2.0,
    price: 8.49,
    imgUrl: "https://static.food2fork.com/burger53be.jpg",
  ),
  FoodItem(
    id: 4,
    title: "Chicken Chapli & Shami Kabab",
    description: "Quershi kabab",
    ratings: 3.5,
    price: 14.49,
    imgUrl: "https://static.food2fork.com/36725137eb.jpg",
  ),
  FoodItem(
    id: 5,
    title: "Chicken Kabab, and Beef Roll",
    description: "Our special rolls",
    ratings: 4.5,
    price: 14.49,
    imgUrl: "https://static.food2fork.com/turkeyburger300x200ff84052e.jpg",
  ),
  FoodItem(
    id: 6,
    title: "Beef Stew",
    description: "Turakmani flavor",
    ratings: 3.0,
    price: 14.49,
    imgUrl:
        "https://cdn.pixabay.com/photo/2018/03/04/20/08/burger-3199088__340.jpg",
  ),
]);

class FooditemList {
  List<FoodItem> foodItems;

  FooditemList({@required this.foodItems});
}

class FoodItem {
  int id;
  String title;
  String description;
  double price;
  double ratings;
  String imgUrl;
  int quantity;

  FoodItem({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.price,
    @required this.imgUrl,
    @required this.ratings,
    this.quantity = 1,
  });

  void incrementQuantity() {
    this.quantity = this.quantity + 1;
  }

  void decrementQuantity() {
    this.quantity = this.quantity - 1;
  }
}
