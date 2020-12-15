import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 6.0,
      borderRadius: BorderRadius.circular(20.0),
      child: TextField(
        decoration: InputDecoration(
            contentPadding:
                EdgeInsets.symmetric(horizontal: 32.0, vertical: 14.0),
            hintText: "Search any food",
            suffixIcon: Icon(
              Icons.search,
              color: Colors.black,
            ),
            border: InputBorder.none),
      ),
    );
  }
}
