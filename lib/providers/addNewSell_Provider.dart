import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:installment_demo/module/installmentInfo.dart';
import 'package:installment_demo/module/sellModule.dart';
import 'package:installment_demo/services/sellServices.dart';
import 'package:uuid/uuid.dart';

class AddNewSell extends ChangeNotifier {
  final  sellService=SellServices();
  String _sellModuleId;
  String _custName;
  String _deviceName;
  double _fullPrice;
  double _paidCash;
  int _installmentCount;
  double _oneInstallQty;
  DateTime _sellDate ;
  List<InstallmentInfo> _installment=List();
  String installState='لم يتم دفع ألقسط';
  String _notes;

  String get custName => _custName;
  String get deviceName => _deviceName;
  double get fullPrice => _fullPrice;
  double get paidCash => _paidCash;
  int get installmentCount => _installmentCount;
  double get oneInstallQty => _oneInstallQty;
  DateTime get sellDate => _sellDate;
  List<InstallmentInfo>  installmentInfo;
  String get notes =>_notes;

  changeSellModuleId(String value) {
    _sellModuleId = value;
    notifyListeners();
  }

  changeInstallState(String value) {
    installState = value;
    notifyListeners();
  }
  changeCustName(String value) {
    _custName = value;
    notifyListeners();
  }

  changedeviceName(String value) {
    _deviceName = value;
    notifyListeners();
  }

  changeFullPrice(double value) {
    _fullPrice = value;
    notifyListeners();
  }
  changePaidCash(double value) {
    _paidCash = value;
    notifyListeners();
  }
  changeInstallmentCount(int value) {
    _installmentCount = value;
    notifyListeners();
  }

  changeOneInstallQty( ) {
    _oneInstallQty = (fullPrice-paidCash)/installmentCount;
    notifyListeners();
  }

  changeSellDate(DateTime value) {
    _sellDate = value;
    notifyListeners();
  }

  changeNotes(String value) {
    _notes = value;
    notifyListeners();
  }
  // changeInstallInfo(List<InstallmentInfo> value) {
  //   _installment = value;
  //   notifyListeners();
  // }

  saveSell(List list) async {

      var newSelles=SellModule(custName: custName ,
          deviceName: deviceName,
          fullPrice:fullPrice,
          installmentCount: installmentCount,
          oneInstallQty: oneInstallQty,
          sellDate:Timestamp.fromDate(sellDate),
          paidCash: paidCash,
        notes:notes,

      );
      sellService.saveInstallService(newSelles , list);
  }

  editSell(SellModule sellmodule , List list,docId) async {

    sellService.editInstallService(sellmodule ,list,docId);
  }
}
