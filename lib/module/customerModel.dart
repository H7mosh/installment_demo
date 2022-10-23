import 'dart:core';

class Customers
{
  String custId;
  String custName;
  String custNumber;
  String custAddress;
  String sponserName;
  String sponserNumber;
  String idd;


  Customers({this.custId,this.custName,this.custNumber,this.custAddress,this.sponserName,this.sponserNumber});

  Map<String,dynamic>toMap() {
    return {
      'customerName': custName,
      'customerNumber': custNumber,
      'customerAddress': custAddress,
      'sponsorName': sponserName,
      'sponsorNumber': sponserNumber
    };
  }



Customers.fromFirestore(Map<String, dynamic>fireStore)
          :custName = fireStore['customerName'],
          idd=fireStore['hamoshid'],
          custNumber=fireStore['customerNumber'],
          custAddress=fireStore['customerAddress'],
          sponserName=fireStore['sponsorName'],
          sponserNumber=fireStore['sponsorNumber'];

}