import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:installment_demo/module/installmentInfo.dart';

class SellModule {
  String id; //document ID in firebase
  String sellModuleId;
  String custName;
  String deviceName;
  String notes;
  double fullPrice;
  double paidCash;
  int installmentCount;
  double oneInstallQty;
  Timestamp sellDate;
  List<InstallmentInfo> installInfo;

  SellModule({
    this.id,
    this.sellModuleId,
    this.custName,
    this.deviceName,
    this.fullPrice,
    this.paidCash,
    this.installmentCount,
    this.oneInstallQty,
    this.sellDate,
    this.installInfo,
    this.notes,
  });

  Map<String,dynamic>toMap() {
    return {
      'documentId': id,
      'custName': custName,
      'deviceName': deviceName,
      'notes': notes,
      'fullPrice': fullPrice,
      'paidCash': paidCash,
      'installmentCount': installmentCount,
      'installmentsList': installInfo,
      'oneInstallQty': oneInstallQty,
      'sellDate': sellDate,
    };
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['documentId'] = this.id;
    data['custName'] = this.custName;
    data['notes']=this.notes;
    data['fullPrice']=this.fullPrice;
    data['paidCash']=this.paidCash;
    data['installmentCount']=this.installmentCount;
    data['installmentsList']=this.installInfo;
    data['oneInstallQty']=this.oneInstallQty;
    data['sellDate']=this.sellDate;
  }


   SellModule.fromFirestore(Map<String, dynamic>fireStore)
   {
     sellModuleId=fireStore['id'];
     custName = fireStore['custName'];
     deviceName = fireStore['deviceName'];
     sellModuleId=fireStore['sellID'];
     fullPrice=fireStore['fullPrice'];
     installmentCount=fireStore['installmentCount'];
     notes=fireStore['notes'];
     oneInstallQty=fireStore['oneInstallQty'];
     sellDate=fireStore['sellDate'];
     List list=fireStore['array'];
     list.forEach((element) {
       installInfo.add(InstallmentInfo.fromJson(element));
     });
   }


}



