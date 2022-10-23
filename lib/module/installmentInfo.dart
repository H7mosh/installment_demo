import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';

class InstallmentInfo
{
  String installmentID;
  Timestamp installmentDate;
  bool IsPaid;

  InstallmentInfo.fromJson(Map map){
    installmentDate =map['install_Date'];
    IsPaid =map['isPaid'];
  }

  InstallmentInfo({this.installmentID,this.installmentDate,this.IsPaid});

  Map<String,dynamic>toMap() {
    return {
      'install_Date': installmentDate,
      'isPaid': IsPaid,
    };
  }




  InstallmentInfo.fromFirestore(Map<String, dynamic>fireStore)
      : installmentDate = fireStore['install_Date'],
        IsPaid=fireStore['isPaid'];
}