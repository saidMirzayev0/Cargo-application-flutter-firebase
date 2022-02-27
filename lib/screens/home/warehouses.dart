import 'package:email_password_login/model/const.dart';
import 'package:email_password_login/model/warehouses.dart';
import 'package:email_password_login/widgets/listview.dart';
import 'package:flutter/material.dart';

class WareHouse extends StatefulWidget {
  const WareHouse({Key? key}) : super(key: key);

  @override
  _WareHouseState createState() => _WareHouseState();
}

class _WareHouseState extends State<WareHouse> {
  List<WareHousesModel> contacts = [
    WareHousesModel(
      "Yevlax, K.Sabitov",
      "0778979454",
    ),
    WareHousesModel(
      "Bakı, Neftçilər R.Rustemov",
      "0553477629",
    ),
    WareHousesModel(
      "Qebele, I.Qayibov",
      "0506839346",
    ),
    WareHousesModel(
      "Susa",
      "0773648798",
    ),
    WareHousesModel(
      "Qax, Z.Tagiyev St",
      "0552803802",
    ),
    WareHousesModel(
      "Bilesuvar, B.Xanmemmedova",
      "0704729749",
    ),
    WareHousesModel(
      "Samaxi, Mehemmed Emin Rasulzade",
      "0502680138",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.red[900],
          // ignore: prefer_const_literals_to_create_immutables

          title: Text('Ambar',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 23))),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                    itemCount: contacts.length,
                    itemBuilder: (BuildContext context, int index) {
                      // return item
                      return ContactItem(
                        contacts[index].title,
                        contacts[index].subtitile,
                        index,
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget ContactItem(String name, String phoneNumber, int index) {
    return ListTile(
      leading: Icon(
        Icons.store_mall_directory,
        color: mainColor,
      ),
      title: Text(
        name,
        style: TextStyle(
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: Text(phoneNumber),
    );
  }
}
