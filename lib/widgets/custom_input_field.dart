import 'package:flutter/material.dart';

class CustomInputFieldFb1 extends StatelessWidget {
  final TextEditingController inputController;
  final String hintText;
  final Color primaryColor;

  const CustomInputFieldFb1(
      {Key? key,
      required this.inputController,
      required this.hintText,
      this.primaryColor = Colors.purple})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            offset: const Offset(12, 26),
            blurRadius: 50,
            spreadRadius: 0,
            color: Colors.grey.withOpacity(.1)),
      ]),
      child: TextField(
        controller: inputController,
        onChanged: (value) {
          //Do something wi
        },
        keyboardType: TextInputType.emailAddress,
        style: const TextStyle(fontSize: 14, color: Colors.black),
        decoration: InputDecoration(
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey.withOpacity(.75)),
          fillColor: Colors.transparent,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: primaryColor, width: 2.0),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: primaryColor, width: 2.0),
          ),
          errorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 2.0),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: primaryColor, width: 2.0),
          ),
        ),
      ),
    );
  }
}
