// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_password_login/model/const.dart';
import 'package:email_password_login/model/models.dart';
import 'package:email_password_login/screens/home/home.dart';
import 'package:email_password_login/screens/new%20package/pay.dart';
import 'package:email_password_login/widgets/custom_input_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NewAddPage extends StatefulWidget {
  const NewAddPage({Key? key}) : super(key: key);

  @override
  _NewAddPageState createState() => _NewAddPageState();
}

final _auth = FirebaseAuth.instance;
int pay = 0;
double _currentSliderValue1 = 20.0;
double _currentSliderValue2 = 20.0;
double _currentSliderValue3 = 20.0;
double _currentSliderValue4 = 2.0;
String payer = 'nothing';
String payMethod = 'nothing';
int _checkbox1 = 1;
int _checkbox2 = 2;

//CONTROLLERS
final descEditingController = new TextEditingController();
final fromWhoEditingController = new TextEditingController();
final toWhoEditingController = new TextEditingController();
final NumberSenderEditingController = new TextEditingController();
final NumberRecipientEditingController = new TextEditingController();
final AdressOriginEditingController = new TextEditingController();
final AdressDestEditingController = new TextEditingController();

class _NewAddPageState extends State<NewAddPage> {
  // form key
  final _formKey = GlobalKey<FormState>();

  Widget _buildHeader() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          "Qutu haqqında",
          style: const TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ],
    );
  }

  Widget _buildHeader2() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Şəxslərin kimliyi",
          style: const TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ],
    );
  }

  Widget _buildHeader3() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Əlaqə ",
          style: const TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ],
    );
  }

  Widget _buildHeader4() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Ünvanlar",
          style: const TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ],
    );
  }

  Widget _buildBoxWidth() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      ClipRRect(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.18,
          width: MediaQuery.of(context).size.width * 0.89,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 17),
                  child: Text(
                    'Qutu eni',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 17),
                  child: Text(
                    'sm',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Slider(
              value: _currentSliderValue1,
              min: 0,
              max: 100,
              divisions: 5,
              label: _currentSliderValue1.roundToDouble().toString(),
              onChanged: (double value) {
                setState(() {
                  _currentSliderValue1 = value;
                });
              },
            ),
          ]),
        ),
      ),
    ]);
  }

  Widget _buildBoxLength() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      ClipRRect(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.18,
          width: MediaQuery.of(context).size.width * 0.89,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 17),
                  child: Text(
                    'Qutu uzunluğu',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 17),
                  child: Text(
                    'sm',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Slider(
              value: _currentSliderValue2,
              min: 0,
              max: 100,
              divisions: 5,
              label: _currentSliderValue2.roundToDouble().toString(),
              onChanged: (double value) {
                setState(() {
                  _currentSliderValue2 = value;
                });
              },
            ),
          ]),
        ),
      ),
    ]);
  }

  Widget _buildBoxHeight() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      ClipRRect(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.18,
          width: MediaQuery.of(context).size.width * 0.89,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 17),
                  child: Text(
                    'Qutu hündürlüyü',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 17),
                  child: Text(
                    'sm',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Slider(
              value: _currentSliderValue3,
              min: 0,
              max: 100,
              divisions: 5,
              label: _currentSliderValue3.roundToDouble().toString(),
              onChanged: (double value) {
                setState(() {
                  _currentSliderValue3 = value;
                });
              },
            ),
          ]),
        ),
      ),
    ]);
  }

  Widget _buildBoxWeight() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      ClipRRect(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.18,
          width: MediaQuery.of(context).size.width * 0.89,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 17),
                  child: Text(
                    'Qutu çəkisi',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 17),
                  child: Text(
                    'kq',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Slider(
              value: _currentSliderValue4,
              min: 0,
              max: 10,
              divisions: 5,
              label: _currentSliderValue4.roundToDouble().toString(),
              onChanged: (double value) {
                setState(() {
                  _currentSliderValue4 = value;
                });
              },
            ),
          ]),
        ),
      ),
    ]);
  }

  Widget _buildPackageAbout() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.18,
            width: MediaQuery.of(context).size.width * 0.89,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 17),
                      child: Text(
                        'Xüsusi qeydlər',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: TextFormField(
                    minLines: 2,
                    maxLines: 4,
                    controller: descEditingController,
                    keyboardType: TextInputType.text,
                    onChanged: (value) {
                      setState(() {});
                    },
                    decoration: InputDecoration(
                        labelText: 'Daxil et', border: OutlineInputBorder()),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _buildCalculationButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 1.2 * (MediaQuery.of(context).size.height / 20),
          width: 7 * (MediaQuery.of(context).size.width / 10),
          margin: EdgeInsets.only(bottom: 20, top: 10),
          child: RaisedButton(
            color: mainColor,
            elevation: 5.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            onPressed: () {
              calculated();
            },
            child: Text(
              "Hesabla",
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 1.5,
                fontWeight: FontWeight.bold,
                fontSize: MediaQuery.of(context).size.height / 40,
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildFromWho() {
    return Container(
      width: 350,
      child: CustomInputFieldFb1(
        hintText: "Kimdən(Ad,Soyad)",
        primaryColor: mainColor,
        inputController: fromWhoEditingController,
      ),
    );
  }

  Widget _buildToWho() {
    return Container(
      width: 350,
      child: CustomInputFieldFb1(
        hintText: "Kimə(Ad,Soyad)",
        primaryColor: mainColor,
        inputController: toWhoEditingController,
      ),
    );
  }

  Widget _buildNumberSender() {
    return Container(
      width: 350,
      child: CustomInputFieldFb1(
        hintText: "Mobil nömrə(Göndərən)",
        primaryColor: mainColor,
        inputController: NumberSenderEditingController,
      ),
    );
  }

  Widget _buildNumberRecipient() {
    return Container(
      width: 350,
      child: CustomInputFieldFb1(
        hintText: "Mobil nömrə(Alan)",
        primaryColor: mainColor,
        inputController: NumberRecipientEditingController,
      ),
    );
  }

  Widget _buildAdressOrigin() {
    return Container(
      width: 350,
      child: CustomInputFieldFb1(
        hintText: "Hardan(Şəhər/Rayon, Kənd/Qəsəbə, Küçə, Mənzil/Ev)",
        primaryColor: mainColor,
        inputController: AdressOriginEditingController,
      ),
    );
  }

  Widget _buildAdressDest() {
    return Container(
      width: 350,
      child: CustomInputFieldFb1(
        hintText: "Hara(Şəhər/Rayon, Kənd/Qəsəbə, Küçə, Mənzil/Ev)",
        primaryColor: mainColor,
        inputController: AdressDestEditingController,
      ),
    );
  }

  Widget _buildcalculation() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      ClipRRect(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.18,
          width: MediaQuery.of(context).size.width * 0.89,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Text(
                  'Toplam qiymet:' "$pay",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
                )
              ],
            ),
          ]),
        ),
      ),
    ]);
  }

  Widget _buildNextButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 1.2 * (MediaQuery.of(context).size.height / 20),
          width: 7 * (MediaQuery.of(context).size.width / 10),
          margin: EdgeInsets.only(bottom: 20, top: 10),
          child: RaisedButton(
            color: mainColor,
            elevation: 5.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            onPressed: () {
              Navigator.push((context),
                  MaterialPageRoute(builder: (context) => PayPage()));
            },
            child: Text(
              "Dəvam",
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 1.5,
                fontWeight: FontWeight.bold,
                fontSize: MediaQuery.of(context).size.height / 40,
              ),
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[900],
        // ignore: prefer_const_literals_to_create_immutables
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.info_outline,
                size: 25,
              )),
        ],

        title: Text(
          'Yeni Paket',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w900, fontSize: 23),
        ),
      ),
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: SafeArea(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                _buildHeader(),
                SizedBox(height: 20),
                _buildBoxWidth(),
                SizedBox(height: 20),
                _buildBoxHeight(),
                SizedBox(height: 20),
                _buildBoxLength(),
                SizedBox(height: 20),
                _buildBoxWeight(),
                SizedBox(height: 20),
                _buildHeader2(),
                SizedBox(height: 20),
                _buildFromWho(),
                SizedBox(height: 20),
                _buildToWho(),
                SizedBox(height: 20),
                _buildHeader3(),
                SizedBox(height: 20),
                _buildNumberSender(),
                SizedBox(height: 20),
                _buildNumberRecipient(),
                SizedBox(height: 20),
                _buildHeader4(),
                SizedBox(height: 20),
                _buildAdressOrigin(),
                SizedBox(height: 20),
                _buildAdressDest(),
                SizedBox(height: 10),
                _buildPackageAbout(),
                SizedBox(height: 20),
                _buildCalculationButton(),
                SizedBox(height: 20),
                _buildcalculation(),
                SizedBox(height: 20),
                _buildNextButton(),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //CALCULATED PAY
  calculated() {
    if (_currentSliderValue4 > 4.0) {
      setState(() {
        pay = 10;
      });
    } else {
      setState(() {
        pay = 5;
      });
    }
  }
}

class PayPage extends StatefulWidget {
  const PayPage({
    Key? key,
  }) : super(key: key);

  @override
  _PayPageState createState() => _PayPageState();
}

class _PayPageState extends State<PayPage> {
  Widget _buildIllustrations() {
    return Container(
      width: 230,
      height: 150,
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(
                  "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/finance_app_2%2Fillustrations%2FIllutration3.png?alt=media&token=e0efc2d1-cc3f-4a92-8660-9862ea7510a5"))),
    );
  }

  Widget _buildContainer1() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      ClipRRect(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.2,
            width: MediaQuery.of(context).size.width * 0.89,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Column(children: [
                    Row(children: [
                      SizedBox(
                        width: 10,
                      ),
                      Row(
                        children: [
                          Radio(
                            value: 1,
                            groupValue: _checkbox1,
                            onChanged: (_handlecheckType) {
                              setState(() {
                                _checkbox1 = 1;
                              });
                            },
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Göndərən',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ]),
                    Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Row(
                          children: [
                            Radio(
                              value: 2,
                              groupValue: _checkbox1,
                              onChanged: (_handlecheckType) {
                                setState(() {
                                  _checkbox1 = 2;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Qəbul edən',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ],
                    ),
                  ]),
                ]),
          ))
    ]);
  }

  Widget _buildContainer2() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      ClipRRect(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.2,
            width: MediaQuery.of(context).size.width * 0.89,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Column(children: [
                    Row(children: [
                      SizedBox(
                        width: 10,
                      ),
                      Row(
                        children: [
                          Radio(
                            value: 1,
                            groupValue: _checkbox2,
                            onChanged: (_handlecheckType) {
                              setState(() {
                                _checkbox2 = 1;
                              });
                            },
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Kartla',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ]),
                    Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Row(
                          children: [
                            Radio(
                              value: 2,
                              groupValue: _checkbox2,
                              onChanged: (_handlecheckType) {
                                setState(() {
                                  _checkbox2 = 2;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Nəğd',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ],
                    ),
                  ]),
                ]),
          ))
    ]);
  }

  Widget _buildNextButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 1.2 * (MediaQuery.of(context).size.height / 20),
          width: 7 * (MediaQuery.of(context).size.width / 10),
          margin: EdgeInsets.only(bottom: 20, top: 10),
          child: RaisedButton(
            color: mainColor,
            elevation: 5.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            onPressed: () {
              createData();
            },
            child: Text(
              "Dəvam",
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 1.5,
                fontWeight: FontWeight.bold,
                fontSize: MediaQuery.of(context).size.height / 40,
              ),
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[900],
        // ignore: prefer_const_literals_to_create_immutables
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.info_outline,
                size: 25,
              )),
        ],
        title: Text(
          'Odenis',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w900, fontSize: 23),
        ),
      ),
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 20),
              _buildIllustrations(),
              SizedBox(height: 20),
              _buildContainer1(),
              SizedBox(height: 20),
              _buildContainer2(),
              SizedBox(height: 20),
              _buildNextButton(),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  createData() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;
    PackageModel packageModel = PackageModel();
    UserModel userModel = UserModel();

    payerFunc();
    payMethodFunc();

    packageModel.boxWidth = _currentSliderValue1;
    packageModel.boxHeight = _currentSliderValue2;
    packageModel.boxLength = _currentSliderValue3;
    packageModel.boxWeight = _currentSliderValue4;
    packageModel.packageAbout = descEditingController.text;
    packageModel.FromWho = fromWhoEditingController.text;
    packageModel.ToWho = toWhoEditingController.text;
    packageModel.NumberSender = NumberSenderEditingController.text;
    packageModel.NumberRecipient = NumberRecipientEditingController.text;
    packageModel.AdressOrigin = AdressOriginEditingController.text;
    packageModel.AdressDest = AdressDestEditingController.text;
    packageModel.totalValue = pay;
    packageModel.uid = user!.uid;
    packageModel.payMethod = payMethod;
    packageModel.payer = payer;

    await firebaseFirestore
        .collection("package")
        .doc()
        .set(packageModel.toMap());

    navigatorFunct();
  }

  navigatorFunct() {
    Navigator.push(
        (context), MaterialPageRoute(builder: (context) => Home1Page()));
  }

  payerFunc() {
    if (_checkbox1 == 1) {
      setState(() {
        payer = 'Göndərən';
      });
    } else {
      setState(() {
        payer = 'Qəbul edən';
      });
    }
  }

  payMethodFunc() {
    if (_checkbox2 == 1) {
      setState(() {
        payMethod = 'Kartla';
      });
    } else {
      setState(() {
        payMethod = 'Nəğd';
      });
    }
  }
}
