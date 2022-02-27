import 'package:flutter/material.dart';

class Courier extends StatefulWidget {
  const Courier({Key? key}) : super(key: key);

  @override
  _CourierState createState() => _CourierState();
}

class _CourierState extends State<Courier> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // ignore: duplicate_ignore
        appBar: AppBar(
          backgroundColor: Colors.red[900],
          // ignore: prefer_const_literals_to_create_immutables

          title: Text(
            'Kuryer Xidmeti',
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
                    'Kuryer xidmeti aktiv deyil',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
