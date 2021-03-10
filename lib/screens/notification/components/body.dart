import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  //GlobalState globalState = GlobalState.instance;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Column(
        children: [
          Text(
            "Your Notification",
            //        globalState.email,
            style: TextStyle(color: Colors.black),
          ),
          Text(
            "Notification items",
            style: Theme.of(context).textTheme.caption,
          ),
        ],
      ),
    );
  }
}
