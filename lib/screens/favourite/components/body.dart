import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Column(
        children: [
          Text(
            "Your Favourite",
            style: TextStyle(color: Colors.black),
          ),
          Text(
            "Favourite items",
            style: Theme.of(context).textTheme.caption,
          ),
        ],
      ),
    );
  }
}
