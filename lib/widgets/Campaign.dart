// ignore_for_file: file_names

import 'package:flutter/material.dart';

class Campaign extends StatelessWidget {
  final String photo;
  Campaign({
    required this.photo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 125,
      margin: EdgeInsets.only(left: 8, right: 0, top: 4, bottom: 4),
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(photo), fit: BoxFit.cover),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Stack(
        children: [],
      ),
    );
  }
}
