import 'package:email_password_login/screens/new%20package/new.dart';
import 'package:flutter/material.dart';

class HomeContainerItem extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback? onClicked;

  const HomeContainerItem({
    required this.text,
    required this.icon,
    required this.onClicked,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Colors.white;
    final hoverColor = Colors.white70;

    return Container(
        width: 380,
        height: 50,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        // ignore: deprecated_member_use
        child: FlatButton(
            onPressed: onClicked,
            color: color,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(text),
                Icon(icon),
              ],
            )));
  }
}
