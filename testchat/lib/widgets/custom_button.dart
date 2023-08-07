import 'package:flutter/material.dart';
// 

class Custombutton extends StatelessWidget {
  Custombutton({this.onTap, required this.text ,required this.colorbutton});
  String text;
  void Function()? onTap;
  Color colorbutton;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: colorbutton,
        ),
        height: 60,
        width: double.infinity,
        child: Center(
            child: Text(
          text,
          style: const TextStyle(fontSize: 16),
        )),
      ),
    );
  }
}
