import 'package:flutter/material.dart';

class DefaultTextFieldOutlined extends StatelessWidget {
  String text;
  IconData icon;
  EdgeInsetsGeometry margin;
  DefaultTextFieldOutlined(
      {required this.text,
      required this.icon,
      this.margin = const EdgeInsets.only(top: 50, left: 20, right: 20)});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: margin,
      decoration: BoxDecoration(
          color: Color.fromRGBO(255, 255, 255, 0.2),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          )),
      child: TextFormField(
        decoration: InputDecoration(
            label: Text(text),
            //border: InputBorder.none,
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
              color: Color.fromARGB(255, 35, 161, 183),
              width: 1,
            )),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
              color: Color.fromARGB(255, 34, 101, 202),
              width: 1,
            )),
            prefixIcon: Container(
              margin: EdgeInsets.only(top: 10),
              child: Wrap(
                alignment: WrapAlignment.spaceEvenly,
                children: [
                  Icon(icon),
                  Container(
                    height: 20,
                    width: 1,
                    color: Color.fromARGB(255, 0, 0, 0),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
