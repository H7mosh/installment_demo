import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:installment_demo/module/customerModel.dart';
import 'package:installment_demo/services/customerServices.dart';


class custProvider extends ChangeNotifier
{
  final  customerServices=custServices();
   String _custName;
   String _custNumber;
   String _custAddress;
   String _custImageUrl;
   String _sponsorName;
   String _sponsorNumber;

   String get custName=>_custName;
   String get custNumber=>_custNumber;
   String get custAddress=>_custAddress;
   String get custImageUrl=>_custImageUrl;
   String get sponsorName=>_sponsorName;
   String get sponsorNumber=>_sponsorNumber;

   Change_custName(String value)
   {
    _custName=value;
    notifyListeners();
  }
   Change_custNumber(String value)
   {
     _custNumber=value;
     notifyListeners();
   }
   Change_custAddress(String value)
   {
     _custAddress=value;
     notifyListeners();
   }
   Change_sponsorName(String value)
   {
     _sponsorName=value;
     notifyListeners();
   }
   Change_sponsorNumber(String value)
   {
     _sponsorNumber=value;
     notifyListeners();
   }

  Change_imageUrl(String value)
  {
    _custImageUrl=value;
    notifyListeners();
  }


   saveCutomer()
   {
     var newCustomer=Customers(custName: custName ,custNumber: custNumber,custAddress: custAddress,sponserName: sponsorName,sponserNumber: sponsorNumber);
     customerServices.saveCustomeService(newCustomer);
   }

  editCutomer(selectedId)
  {
    var newCustomer=Customers(custName: custName ,custNumber: custNumber,custAddress: custAddress,sponserName: sponsorName,sponserNumber: sponsorNumber);
    customerServices.editCustomer(selectedId ,newCustomer);
  }
  deleteCutomer(selectedId)
  {
    var newCustomer=Customers(custName: custName ,custNumber: custNumber,custAddress: custAddress,sponserName: sponsorName,sponserNumber: sponsorNumber);
    customerServices.deleteCustomer(selectedId);
  }
}