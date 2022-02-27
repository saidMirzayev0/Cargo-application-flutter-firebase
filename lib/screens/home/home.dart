// ignore_for_file: prefer_const_constructors
import 'package:email_password_login/model/assets.dart';
import 'package:email_password_login/model/const.dart';
import 'package:email_password_login/screens/other/contact.dart';
import 'package:email_password_login/screens/other/courier.dart';
import 'package:email_password_login/screens/home/warehouses.dart';
import 'package:email_password_login/screens/new%20package/my_package.dart';
import 'package:email_password_login/screens/new%20package/new.dart';
import 'package:email_password_login/screens/profil/profil.dart';
import 'package:email_password_login/screens/other/user_about.dart';
import 'package:email_password_login/widgets/Campaign.dart';
import 'package:email_password_login/widgets/drawer.dart';
import 'package:email_password_login/widgets/home_containers.dart';
import 'package:flutter/material.dart';

class Home1Page extends StatefulWidget {
  const Home1Page({Key? key}) : super(key: key);

  @override
  _Home1PageState createState() => _Home1PageState();
}

class _Home1PageState extends State<Home1Page> {
  //CAMPAIGN HEADER
  Widget _buildHeadder1() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        Text(
          'Kampaniyalar',
          style: TextStyle(fontSize: 20, fontFamily: 'Poppins'),
        ),
        Container(width: 100, height: 3, color: mainColor),
        SizedBox(
          height: 25,
        )
      ],
    );
  }

  //FAST TRANSITION HEADER
  Widget _buildHeadder2() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        Text(
          'Sürətli Keçid',
          style: TextStyle(fontSize: 20, fontFamily: 'Poppins'),
        ),
        Container(width: 100, height: 3, color: mainColor),
        SizedBox(
          height: 25,
        )
      ],
    );
  }

  //CAMPAIGN SECTION
  Widget _buildCampaign() {
    // ignore: sized_box_for_whitespace
    return Container(
      height: 200,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Campaign(
            photo: kamp1,
          ),
          Campaign(
            photo: kamp2,
          ),
          Campaign(
            photo: kamp3,
          ),
          Campaign(
            photo: kamp4,
          ),
          Campaign(
            photo: kamp5,
          )
        ],
      ),
    );
  }

  //FAST TRANSATION SECTION

  Widget _buildContainer() {
    return Column(
      children: [
        HomeContainerItem(
            text: 'Yeni sifariş',
            icon: Icons.arrow_forward_ios,
            onClicked: () {
              Navigator.push((context),
                  MaterialPageRoute(builder: (context) => NewAddPage()));
            }),
        SizedBox(
          height: 10,
        ),
        HomeContainerItem(
            text: 'Ambarlar',
            icon: Icons.arrow_forward_ios,
            onClicked: () {
              Navigator.push((context),
                  MaterialPageRoute(builder: (context) => WareHouse()));
            }),
        SizedBox(
          height: 10,
        ),
        HomeContainerItem(
            text: 'Kuryer ol',
            icon: Icons.arrow_forward_ios,
            onClicked: () {
              Navigator.push((context),
                  MaterialPageRoute(builder: (context) => Courier()));
            }),
        SizedBox(
          height: 10,
        ),
        HomeContainerItem(
            text: 'Paketlərim',
            icon: Icons.arrow_forward_ios,
            onClicked: () {
              Navigator.push((context),
                  MaterialPageRoute(builder: (context) => MyPackage()));
            }),
        SizedBox(
          height: 10,
        ),
        HomeContainerItem(
            text: 'Əlaqə',
            icon: Icons.arrow_forward_ios,
            onClicked: () {
              Navigator.push((context),
                  MaterialPageRoute(builder: (context) => Contact()));
            }),
        SizedBox(
          height: 10,
        ),
        HomeContainerItem(
            text: 'Profil',
            icon: Icons.arrow_forward_ios,
            onClicked: () {
              Navigator.push(
                  (context), MaterialPageRoute(builder: (context) => Profil()));
            }),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      // ignore: duplicate_ignore
      appBar: AppBar(
        backgroundColor: Colors.red[900],

        // ignore: prefer_const_literals_to_create_immutables

        title: Text(
          'Ana Səhifə',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w900, fontSize: 23),
        ),
      ),
      drawer: DrawerFb1(),
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            // ignore: sized_box_for_whitespace

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                _buildHeadder1(),
                _buildCampaign(),
                SizedBox(
                  height: 20,
                ),
                _buildHeadder2(),
                _buildContainer()
              ],
            )
          ],
        ),
      ),
    ));
  }
}
