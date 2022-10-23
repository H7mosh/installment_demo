import 'package:flutter/material.dart';
import 'package:installment_demo/providers/current_user.dart';
import 'package:installment_demo/screens/Home.dart';
import 'package:installment_demo/screens/Login_screen.dart';
import 'package:provider/provider.dart';

enum AuthStatus{notLogggedIn,LoggedIn}

class rootScreen extends StatefulWidget {
  static const String route_name='root_screen';
  @override
  _rootScreenState createState() => _rootScreenState();
}

class _rootScreenState extends State<rootScreen> {
  AuthStatus _authStatus=AuthStatus.notLogggedIn;

  @override
  void didChangeDependencies() async{
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    currentUserState _currentUser=Provider.of<currentUserState>(context,listen: false);
    bool userStatus= await _currentUser.CheckUserLoggedIn();
    if(userStatus==true)
    {
      setState(() {
        _authStatus=AuthStatus.LoggedIn;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget retVal;
    switch(_authStatus)
    {
      case AuthStatus.notLogggedIn:
        retVal=Login_screen();
      break;
      case AuthStatus.LoggedIn:
        retVal=home();
        break;

    }
    return retVal;
  }
}
