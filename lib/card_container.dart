import 'package:flutter/material.dart';

class CardContainer extends StatelessWidget {
  CardContainer({
    super.key,
    required this.color,
    required this.cardChild,
    required this.onPress
  });

  Color color;
  Widget cardChild;
  final void Function() onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        child: cardChild,
        height: 200,
        width: 170,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      onTap: onPress,
    );
  }
}