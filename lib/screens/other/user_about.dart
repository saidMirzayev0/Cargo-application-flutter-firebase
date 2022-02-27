import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_password_login/model/models.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserAbout extends StatefulWidget {
  const UserAbout({Key? key}) : super(key: key);

  @override
  _UserAboutState createState() => _UserAboutState();
}

class _UserAboutState extends State<UserAbout> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
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
            'Istifadeci Melumatlari',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w900, fontSize: 23),
          ),
        ),
        backgroundColor: Colors.grey[300],
        body: SafeArea(
          child: Stack(
            children: <Widget>[
              // ignore: sized_box_for_whitespace

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
