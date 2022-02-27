class UserModel {
  String? uid;
  String? email;
  String? nameSurname;
  String? number;

  UserModel({
    this.uid,
    this.email,
    this.nameSurname,
    this.number,
  });

  // receiving data from server
  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      nameSurname: map['nameSurname'],
      number: map['number'],
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'nameSurname': nameSurname,
      'number': number,
    };
  }
}

class PackageModel {
  String? FromWho;
  String? ToWho;
  String? NumberRecipient;
  String? NumberSender;
  String? AdressOrigin;
  String? AdressDest;
  String? uid;
  double? boxWidth;
  double? boxHeight;
  double? boxLength;
  double? boxWeight;
  int? totalValue;
  String? packageAbout;
  String? payMethod;
  String? payer;

  PackageModel(
      {this.uid,
      this.FromWho,
      this.ToWho,
      this.NumberRecipient,
      this.NumberSender,
      this.AdressOrigin,
      this.AdressDest,
      this.boxWidth,
      this.boxHeight,
      this.boxLength,
      this.boxWeight,
      this.packageAbout,
      this.totalValue,
      this.payer,
      this.payMethod});

  factory PackageModel.fromMap(map) {
    return PackageModel(
        uid: map['uid'],
        FromWho: map['FromWho'],
        ToWho: map['ToWho'],
        NumberRecipient: map['NumberRecipient'],
        NumberSender: map['NumberSender'],
        AdressOrigin: map['AdresOrigin'],
        AdressDest: map['AdressDest'],
        boxWidth: map['BoxWidth'],
        boxHeight: map['BoxHeight'],
        boxLength: map['BoxLength'],
        boxWeight: map['BoxWeight'],
        packageAbout: map['PackageAbout'],
        payMethod: map['PayMethod'],
        payer: map['Payer'],
        totalValue: map['TotalValue']);
  }
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'FromWho': FromWho,
      'ToWho': ToWho,
      'NumberRecipient': NumberRecipient,
      'NumberSender': NumberSender,
      'AdressOrigin': AdressOrigin,
      'AdressDest': AdressDest,
      'BoxWidth': boxWidth,
      'BoxHeight': boxHeight,
      'BoxLength': boxLength,
      'BoxWeight': boxWeight,
      'PackageAbout': packageAbout,
      'TotalVAlue': totalValue,
      'PayMethod': payMethod,
      'Payer': payer,
    };
  }
}
