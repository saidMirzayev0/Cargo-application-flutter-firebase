import 'package:flutter/material.dart';

class Listview extends StatelessWidget {
  final String title;
  final String subtitle;
  const Listview({required this.title, required this.subtitle, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
    );
  }
}
