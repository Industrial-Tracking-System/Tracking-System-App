import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final Function press;
  final Color color, textColor;
  final double width;

  const Button({
    Key key,
    this.text,
    this.press,
    this.color,
    this.textColor,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: width,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: TextButton(
          style: TextButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            backgroundColor: color,
          ),
          onPressed: press,
          child: Text(
            text,
            style: TextStyle(color: textColor),
          ),
        ),
      ),
    );
  }
}
