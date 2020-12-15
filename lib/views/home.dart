import 'package:flutter/material.dart';
import 'package:foodapps/widgets/food_category.dart';
import 'package:foodapps/widgets/home_top_info.dart';
import 'package:foodapps/widgets/search_field.dart';
import 'package:foodapps/widgets/bought_food.dart';

//Data
import 'package:foodapps/data/food_data.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Food> _food = foods;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
        children: <Widget>[
          HomeTopInfo(),
          SearchField(),
          SizedBox(
            height: 5.0,
          ),
          FoodCategory(),
          SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Hot Picks",
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Text(
                  "View All",
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.redAccent),
                ),
              )
            ],
          ),
          SizedBox(
            height: 5.0,
          ),
          Column(children: _food.map(_buildFoodItems).toList()),
        ],
      ),
    );
  }

  Widget _buildFoodItems(Food food) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.0),
      child: BoughtFoods(
        id: food.id,
        name: food.name,
        imagePath: food.imagePath,
        category: food.category,
        discount: food.discount,
        price: food.price,
        ratings: food.ratings,
      ),
    );
  }
}
