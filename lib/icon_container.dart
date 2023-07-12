import 'package:flutter/material.dart';

class IconContent extends StatelessWidget {
  IconContent({super.key, required this.iconData, required this.text});

  String text;
  IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconData,
          size: 80,
        ),
        SizedBox(
          height: 20,
        ),
        Text(
            text,
            style: TextStyle(
              fontSize: 20,
              color: Color(0XFF8D8E91)
            ),
        )
      ],
    );
  }
}