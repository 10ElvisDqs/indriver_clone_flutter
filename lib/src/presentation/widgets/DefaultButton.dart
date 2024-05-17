import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  Function() onPressed;
  String text;
  Color color;
  Color textColor;
  EdgeInsetsGeometry margin;
  DefaultButton({
    required this.text,
    required this.onPressed,
    this.color = Colors.white,
    this.textColor = Colors.black,
    this.margin = const EdgeInsets.only(bottom: 20, left: 40, right: 40),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: MediaQuery.of(context).size.width,
      //alignment: Alignment.center,
      margin: margin,
      child: ElevatedButton(
          onPressed: () {
            onPressed();
          },
          style: ElevatedButton.styleFrom(backgroundColor: color),
          child: Text(
            text,
            style: TextStyle(
                color: textColor, fontSize: 15, fontWeight: FontWeight.bold),
          )),
    );
  }
}
