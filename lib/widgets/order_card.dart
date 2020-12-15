import 'package:flutter/material.dart';

class OrderCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 75,
              width: 40,
              decoration: BoxDecoration(
                  border: Border.all(width: 2.0, color: Color(0xFFd3d3d3)),
                  borderRadius: BorderRadius.circular(10.0)),
              child: Column(
                children: <Widget>[
                  InkWell(
                      onTap: () {},
                      child: Icon(Icons.add, color: Color(0xFFd3d3d3))),
                  Text(
                    "0",
                    style: TextStyle(fontSize: 18.0),
                  ),
                  InkWell(
                      onTap: () {},
                      child: Icon(
                        Icons.remove,
                        color: Color(0xFFd3d3d3),
                      )),
                ],
              ),
            ),
            SizedBox(
              width: 20.0,
            ),
            Container(
              height: 70.0,
              width: 70.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/lunch.jpeg"),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(35.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 5.0,
                    offset: Offset(3.0, 3.0),
                  )
                ],
              ),
            ),
            SizedBox(
              width: 20.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Steamed Salmon",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  "3.0",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                    color: Colors.orangeAccent,
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Container(
                  height: 25.0,
                  width: 120.0,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(right: 10.0),
                        child: Row(
                          children: <Widget>[
                            Text(
                              "Large Drink",
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            InkWell(
                              onTap: () {},
                              child: Text(
                                "x",
                                style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Spacer(),
            GestureDetector(
                child: Icon(
              Icons.cancel,
              color: Colors.grey,
            )),
          ],
        ),
      ),
    );
  }
}
