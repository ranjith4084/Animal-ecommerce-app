import 'package:flutter/material.dart';

class CATEGORIES extends StatelessWidget {
  String pictureId;
  String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text("$pictureId"),
          Text(name),
        ],
      ),
    );
  }

  CATEGORIES(this.name, this.pictureId);
}
