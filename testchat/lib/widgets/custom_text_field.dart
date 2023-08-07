import 'package:flutter/material.dart';

class CustomFormFeild extends StatelessWidget {
  CustomFormFeild(
      {this.onChanged,
      this.hittext,
      required this.label,
      this.obscureText = false});
  String? hittext;
  void Function(String)? onChanged;
  String label;
  bool? obscureText; 
  IconData? icoon ;

  @override
  Widget build(BuildContext context) {
    return TextFormField( 
      
      obscureText: obscureText!,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please Enter Value';
        }
      },
      onChanged: onChanged,
      decoration: InputDecoration( 
        suffixIcon: Icon(icoon) ,
          label: Text(
            label,
          ),
          hintStyle: const TextStyle(color: Colors.black, fontSize: 15),
          hintText: hittext,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(
                color: Colors.black,
              )),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(
                color: Colors.black,
              )),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide:
                  const BorderSide( width: 1.5,color: Color.fromARGB(255, 231, 208, 10)))),
    );
  }
}
