import 'package:flutter/material.dart';

class FoodCard extends StatelessWidget {
  final String categoryName;
  final String imagePath;
  final int numberOfItems;

  FoodCard({this.categoryName, this.imagePath, this.numberOfItems});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 15.0),
      child: Card(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
          child: Row(
            children: <Widget>[
              Image(
                image: AssetImage(imagePath),
                height: 65.0,
                width: 65.0,
              ),
              SizedBox(
                width: 15.0,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(categoryName,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15.0)),
                  Text("$numberOfItems Available",
                      style: TextStyle(
                        fontSize: 13.0,
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
