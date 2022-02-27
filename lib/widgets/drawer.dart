import 'package:email_password_login/model/const.dart';
import 'package:email_password_login/screens/home/warehouses.dart';
import 'package:email_password_login/screens/new%20package/my_package.dart';
import 'package:email_password_login/screens/new%20package/new.dart';
import 'package:email_password_login/screens/other/contact.dart';
import 'package:email_password_login/screens/other/courier.dart';
import 'package:flutter/material.dart';

class DrawerFb1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: mainColor,
        child: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(15.0),
              child: Column(
                children: [
                  const SizedBox(height: 12),
                  Text(
                    'CARGOAZ',
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontFamily: 'Poppins'),
                  ),
                  const SizedBox(height: 12),
                  MenuItem(
                    text: 'Yeni sifaris',
                    icon: Icons.add_box,
                    onClicked: () {
                      Navigator.push(
                          (context),
                          MaterialPageRoute(
                              builder: (context) => NewAddPage()));
                    },
                  ),
                  const SizedBox(height: 5),
                  MenuItem(
                    text: 'Ambarlar',
                    icon: Icons.store,
                    onClicked: () {
                      Navigator.push((context),
                          MaterialPageRoute(builder: (context) => WareHouse()));
                    },
                  ),
                  const SizedBox(height: 5),
                  MenuItem(
                    text: 'Kuryer ol',
                    icon: Icons.person,
                    onClicked: () {
                      Navigator.push((context),
                          MaterialPageRoute(builder: (context) => Courier()));
                    },
                  ),
                  const SizedBox(height: 5),
                  MenuItem(
                    text: 'Paketlerim',
                    icon: Icons.shopping_bag,
                    onClicked: () {
                      Navigator.push((context),
                          MaterialPageRoute(builder: (context) => MyPackage()));
                    },
                  ),
                  const SizedBox(height: 5),
                  MenuItem(
                    text: 'Elaqe',
                    icon: Icons.call,
                    onClicked: () {
                      Navigator.push((context),
                          MaterialPageRoute(builder: (context) => Contact()));
                    },
                  ),
                  const SizedBox(height: 5),
                  MenuItem(
                    text: 'Tetbiq haqqinda',
                    icon: Icons.info_outline,
                    onClicked: () {
                      Navigator.push((context),
                          MaterialPageRoute(builder: (context) => Scaffold()));
                    },
                  ),
                  const SizedBox(height: 8),
                  Divider(color: Colors.white70),
                  const SizedBox(height: 5),
                  MenuItem(
                    text: 'FAQ',
                    icon: Icons.help,
                    onClicked: () {
                      Navigator.push((context),
                          MaterialPageRoute(builder: (context) => Scaffold()));
                    },
                  ),
                  const SizedBox(height: 8),
                  MenuItem(
                    text: 'Tenzimlemeler',
                    icon: Icons.settings,
                    onClicked: () {
                      Navigator.push((context),
                          MaterialPageRoute(builder: (context) => Scaffold()));
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback? onClicked;

  const MenuItem({
    required this.text,
    required this.icon,
    this.onClicked,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Colors.white;
    final hoverColor = Colors.white70;

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: TextStyle(color: color)),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }
}
