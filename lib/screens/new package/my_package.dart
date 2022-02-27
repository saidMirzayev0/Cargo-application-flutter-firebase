import 'package:flutter/material.dart';

class MyPackage extends StatefulWidget {
  const MyPackage({Key? key}) : super(key: key);

  @override
  _MyPackageState createState() => _MyPackageState();
}

class _MyPackageState extends State<MyPackage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      // ignore: duplicate_ignore
      appBar: AppBar(
        backgroundColor: Colors.red[900],
        // ignore: prefer_const_literals_to_create_immutables

        title: Text(
          'Paketlərim',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w900, fontSize: 23),
        ),
      ),
      backgroundColor: Colors.grey[300],
      body: Stack(
        children: <Widget>[
          // ignore: sized_box_for_whitespace

          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  'Heç bir paket yoxdur',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}
