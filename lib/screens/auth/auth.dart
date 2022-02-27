import 'package:email_password_login/screens/auth/login_screen.dart';

import 'package:email_password_login/screens/home/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    if (_auth.currentUser != null) {
      return Home1Page();
    } else {
      return LoginScreen();
    }
  }
}
