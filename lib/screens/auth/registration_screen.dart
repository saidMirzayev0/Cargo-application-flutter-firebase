import 'package:email_password_login/screens/home/home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_password_login/model/const.dart';
import 'package:email_password_login/model/models.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;

  // string for displaying the error Message
  String? errorMessage;

  // our form key
  final _formKey = GlobalKey<FormState>();
  // editing Controller
  final nameSurnameEditingController = new TextEditingController();
  final NumberEditingController = new TextEditingController();
  final emailEditingController = new TextEditingController();
  final passwordEditingController = new TextEditingController();
  final confirmPasswordEditingController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    //name Surname field
    final nameSurnameField = TextFormField(
        autofocus: false,
        controller: nameSurnameEditingController,
        keyboardType: TextInputType.name,
        validator: (value) {
          RegExp regex = new RegExp(r'^.{7,}$');
          if (value!.isEmpty) {
            return ("Ad Soyad daxil edin");
          }
          if (!regex.hasMatch(value)) {
            return ("Düzgün ad qeyd edin(Min. 7 Character)");
          }
          return null;
        },
        onSaved: (value) {
          nameSurnameEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.account_circle),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Ad,Soyad",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    //number field
    final NumberField = TextFormField(
        autofocus: false,
        controller: NumberEditingController,
        keyboardType: TextInputType.number,
        validator: (value) {
          RegExp regex = new RegExp(r'^.{10,}$');
          if (value!.isEmpty) {
            return ("Mobil nömrə daxil edin!");
          }
          if (!regex.hasMatch(value)) {
            return ("Düzgün Mobil nömrə daxil edin(Min. 10 Character)");
          }
          return null;
        },
        onSaved: (value) {
          NumberEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.account_circle),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Mobil Nömre",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    //email field
    final emailField = TextFormField(
        autofocus: false,
        controller: emailEditingController,
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Xahis olunur email daxil edin");
          }
          // reg expression for email validation
          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
              .hasMatch(value)) {
            return ("Düzgün email daxil edin!");
          }
          return null;
        },
        onSaved: (value) {
          nameSurnameEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.mail),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Email",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    //password field
    final passwordField = TextFormField(
        autofocus: false,
        controller: passwordEditingController,
        obscureText: true,
        validator: (value) {
          RegExp regex = new RegExp(r'^.{6,}$');
          if (value!.isEmpty) {
            return ("Şifrə daxil edin");
          }
          if (!regex.hasMatch(value)) {
            return ("Düzgün şifrə daxil edin(Min. 6 element)");
          }
        },
        onSaved: (value) {
          nameSurnameEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.vpn_key),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Şifrə",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    //confirm password field
    final confirmPasswordField = TextFormField(
        autofocus: false,
        controller: confirmPasswordEditingController,
        obscureText: true,
        validator: (value) {
          if (confirmPasswordEditingController.text !=
              passwordEditingController.text) {
            return "Şifrə düzgün daxil edilməyib";
          }
          return null;
        },
        onSaved: (value) {
          confirmPasswordEditingController.text = value!;
        },
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.vpn_key),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Şifrə təkrarı",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    //signup button
    final signUpButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: mainColor,
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            signUp(emailEditingController.text, passwordEditingController.text);
          },
          child: Text(
            "Qeydiyyat",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: mainColor),
          onPressed: () {
            // passing this to our root
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                        height: 180,
                        child: Image.asset(
                          "assets/logo.png",
                          fit: BoxFit.contain,
                        )),
                    SizedBox(height: 45),
                    nameSurnameField,
                    SizedBox(height: 20),
                    NumberField,
                    SizedBox(height: 20),
                    emailField,
                    SizedBox(height: 20),
                    passwordField,
                    SizedBox(height: 20),
                    confirmPasswordField,
                    SizedBox(height: 20),
                    signUpButton,
                    SizedBox(height: 15),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void signUp(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      try {
        await _auth
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((value) => {postDetailsToFirestore()})
            .catchError((e) {
          Fluttertoast.showToast(msg: e!.message);
        });
      } on FirebaseAuthException catch (error) {
        switch (error.code) {
          case "invalid-email":
            errorMessage = "E-poçt ünvanınız səhv formada görünür.";

            break;
          case "wrong-password":
            errorMessage = "Parolunuz səhvdir.";
            break;
          case "user-not-found":
            errorMessage = "Bu e-poçtu olan istifadəçi mövcud deyil.";
            break;
          case "user-disabled":
            errorMessage = "Bu e-poçtu olan istifadəçi deaktiv edilib.";
            break;
          case "too-many-requests":
            errorMessage = "Həddindən artıq sorğu";
            break;
          case "operation-not-allowed":
            errorMessage = "E-poçt və Parolla ilə daxil olmaq aktiv deyil.";
            break;
          default:
            errorMessage = "Müəyyən edilməmiş Xəta baş verdi.";
        }
        Fluttertoast.showToast(msg: errorMessage!);
        print(error.code);
      }
    }
  }

  postDetailsToFirestore() async {
    // calling our firestore
    // calling our user model
    // sedning these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel();

    // writing all the values
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.nameSurname = nameSurnameEditingController.text;
    userModel.number = NumberEditingController.text;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Qeydiyyat uğurlu oldu :) ");

    Navigator.pushAndRemoveUntil((context),
        MaterialPageRoute(builder: (context) => Home1Page()), (route) => false);
  }
}
