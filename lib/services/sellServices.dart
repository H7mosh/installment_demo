import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:installment_demo/module/sellModule.dart';
import 'package:installment_demo/providers/addNewSell_Provider.dart';
import 'package:uuid/uuid.dart';

class SellServices with ChangeNotifier {

  final installmentRef=FirebaseFirestore.instance.collection('sellSomeThing');

  final String uid; //Document ID optional to be used in case you want to update or keep it null if you want to create new.
  SellServices({this.uid});
  FirebaseFirestore _sellFirestoreInstance=FirebaseFirestore.instance;
  final CollectionReference sellService = FirebaseFirestore.instance.collection('sellSomeThing');



  Future<void> saveInstallService(SellModule sellModule , List list) async {

    await FirebaseFirestore.instance.collection("sellSomeThing").add({
      "custName": sellModule.custName,
      "deviceName": sellModule.deviceName,
      "fullPrice": sellModule.fullPrice,
      "paidCash": sellModule.paidCash,
      "installmentCount": sellModule.installmentCount,
      "oneInstallQty": sellModule.oneInstallQty,
      "sellDate": sellModule.sellDate,
      "array": list,
    });
  }
  Future<void> editInstallService(SellModule sellModule , List list , docId) async {

    await FirebaseFirestore.instance.collection('sellSomeThing').doc(docId).set({
          "custName": sellModule.custName,
          "deviceName": sellModule.deviceName,
          "fullPrice": sellModule.fullPrice,
          "paidCash": sellModule.paidCash,
          "installmentCount": sellModule.installmentCount,
          "oneInstallQty": sellModule.oneInstallQty,
          "sellDate": sellModule.sellDate,
          "array": list,
        });
  }
  getinstallment()
  {
    installmentRef.get().then((QuerySnapshot snapshot)
    {
      snapshot.docs.forEach((DocumentSnapshot doc) {
         print(doc.data());
      });
    }
    );
  }

  Stream<List<SellModule>>getAllSellers() {
    return _sellFirestoreInstance.collection("sellSomeThing").snapshots().
    map((snapshot) =>
        snapshot.docs.map((document) {
          Map map = document.data();
          map['sellID'] = document.id;
          return SellModule.fromFirestore(map);
        }).toList());
  }
}
