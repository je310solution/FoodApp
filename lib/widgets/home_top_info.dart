import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeTopInfo extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeTopInfo> {
  String name;
  final textStyle = TextStyle(
    fontSize: 30.0,
    fontWeight: FontWeight.bold,
  );
  final textStyles = TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
  );

  @override
  void initState() {
    _loadUserData();
    super.initState();
  }

  _loadUserData() async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    var user = storage.getString('name');
    if (user != null) {
      setState(() {
        name = user;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("Hi, $name", style: textStyle),
              Text(
                "What would you like to eat?",
                style: textStyles,
              )
            ],
          ),
          Icon(
            Icons.notifications_none,
            size: 30.0,
            color: Theme.of(context).primaryColor,
          ),
        ],
      ),
    );
  }
}
