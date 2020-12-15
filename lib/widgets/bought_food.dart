import 'package:flutter/material.dart';

class BoughtFoods extends StatefulWidget {
  final String id;
  final String category;
  final String name;
  final String imagePath;
  final double price;
  final double discount;
  final double ratings;
  BoughtFoods(
      {this.id,
      this.category,
      this.imagePath,
      this.discount,
      this.name,
      this.price,
      this.ratings});

  @override
  _BoughtFoodsState createState() => _BoughtFoodsState();
}

class _BoughtFoodsState extends State<BoughtFoods> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: Stack(
        children: <Widget>[
          Container(
              height: 200.0,
              width: 360.0,
              child: Image.asset(widget.imagePath, fit: BoxFit.cover)),
          Positioned(
            left: 0.0,
            bottom: 0.0,
            child: Container(
              height: 60.0,
              width: 360.0,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.black, Colors.black26],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter)),
            ),
          ),
          Positioned(
            left: 10.0,
            bottom: 10.0,
            right: 10.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.name,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.star,
                          color: Theme.of(context).primaryColor,
                          size: 20.0,
                        ),
                        Icon(
                          Icons.star,
                          color: Theme.of(context).primaryColor,
                          size: 20.0,
                        ),
                        Icon(
                          Icons.star,
                          color: Theme.of(context).primaryColor,
                          size: 20.0,
                        ),
                        Icon(
                          Icons.star,
                          color: Theme.of(context).primaryColor,
                          size: 20.0,
                        ),
                        Icon(
                          Icons.star,
                          color: Theme.of(context).primaryColor,
                          size: 20.0,
                        ),
                        Text(
                          "(" + widget.ratings.toString() + " Reviews)",
                          style: TextStyle(color: Colors.grey, fontSize: 16.0),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text(
                      "₱" + widget.price.toString(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 18.0),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
