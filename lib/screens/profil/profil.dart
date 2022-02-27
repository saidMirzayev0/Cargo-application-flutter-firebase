import 'package:email_password_login/screens/other/app_about.dart';
import 'package:email_password_login/screens/other/user_about.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_password_login/model/models.dart';
import 'package:email_password_login/screens/auth/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Profil extends StatefulWidget {
  const Profil({Key? key}) : super(key: key);

  @override
  _ProfilState createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  //FIREBASE CALL

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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[900],
        // ignore: prefer_const_literals_to_create_immutables

        title: Text(
          'Profil',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w900, fontSize: 23),
        ),
      ),
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 30,
              ),
              Icon(
                Icons.account_circle_outlined,
                size: 150,
                color: Colors.orange[700],
              ),
              SizedBox(
                height: 20,
              ),
              Text("${loggedInUser.nameSurname}",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.indigo[900],
                      fontWeight: FontWeight.w900)),
              Text("${loggedInUser.email}",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.indigo[600],
                      fontWeight: FontWeight.w600)),
              SizedBox(
                height: 10,
              ),
              Text('Menim profilim',
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey[800],
                      fontWeight: FontWeight.w500)),
              SizedBox(
                height: 30,
              ),
              OutlinedButton(
                onPressed: () {
                  Navigator.push((context),
                      MaterialPageRoute(builder: (context) => AppAbout()));
                },
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Application about",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w300,
                            color: Color(0xff2749FD)),
                      ),
                      Icon(Icons.info_outline, color: Color(0xff2749FD))
                    ]),
                style: ButtonStyle(
                    side: MaterialStateProperty.all(
                        BorderSide(color: Color(0xff2749FD), width: 1.4)),
                    padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(vertical: 20, horizontal: 50)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(40))))),
              ),
              SizedBox(
                height: 30,
              ),
              OutlinedButton(
                onPressed: () {
                  Navigator.push((context),
                      MaterialPageRoute(builder: (context) => UserAbout()));
                },
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "User About",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w300,
                            color: Color(0xff2749FD)),
                      ),
                      Icon(Icons.settings, color: Color(0xff2749FD))
                    ]),
                style: ButtonStyle(
                    side: MaterialStateProperty.all(
                        BorderSide(color: Color(0xff2749FD), width: 1.4)),
                    padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(vertical: 20, horizontal: 50)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(40))))),
              ),
              SizedBox(
                height: 30,
              ),
              OutlinedButton(
                onPressed: () {
                  logout(context);
                },
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Sign Out",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w300,
                            color: Color(0xff2749FD)),
                      ),
                      Icon(Icons.logout, color: Color(0xff2749FD))
                    ]),
                style: ButtonStyle(
                    side: MaterialStateProperty.all(
                        BorderSide(color: Color(0xff2749FD), width: 1.4)),
                    padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(vertical: 20, horizontal: 50)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(40))))),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // the logout function
  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginScreen()));
  }
}
