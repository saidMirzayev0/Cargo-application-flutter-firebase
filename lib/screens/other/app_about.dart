import 'package:flutter/material.dart';

class AppAbout extends StatefulWidget {
  const AppAbout({Key? key}) : super(key: key);

  @override
  State<AppAbout> createState() => _AppAboutState();
}

class _AppAboutState extends State<AppAbout> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // ignore: duplicate_ignore
        appBar: AppBar(
          backgroundColor: Colors.red[900],
          // ignore: prefer_const_literals_to_create_immutables

          title: Text(
            'Tetbiq haqqinda',
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Bu mobil tetbiq 13.12.2021 tarixi etibari ile '
                      'Said Mirzayev ve Faxri Mirzayev terefinden hazirlanmaga baslamisdir. '
                      'Mobil tetbiqin hazirlanma prosesi devam edir.',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'VERSION: Beta 0.0.1',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
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
