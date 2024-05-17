import 'package:flutter/material.dart';

class DefaultTextField extends StatelessWidget {
  String text;
  Function(String text) onChanged;
  IconData icon;
  EdgeInsetsGeometry margin;
  String? Function(String?)? validator;

  DefaultTextField(
      {required this.text,
      required this.icon,
      required this.onChanged,
      this.margin = const EdgeInsets.only(top: 50, left: 20, right: 20),
      this.validator});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: margin,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          )),
      child: TextFormField(
        onChanged: (text) {
          onChanged(text);
        },
        validator: validator,
        decoration: InputDecoration(
            label: Text(text),
            border: InputBorder.none,
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
