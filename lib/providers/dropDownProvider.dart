
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class dropDownProvider with ChangeNotifier
{
  String selectedValue ;



   ChangeMenuItem(String value)
  {
    selectedValue=value;
    notifyListeners();
  }
}