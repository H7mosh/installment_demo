import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:installment_demo/providers/current_user.dart';
import 'package:installment_demo/screens/Home.dart';
import 'package:installment_demo/screens/Signup_screen.dart';
import 'package:installment_demo/screens/root.dart';
import 'package:installment_demo/widdgets/Textbox.dart';
import 'package:provider/provider.dart';
class Login_screen extends StatelessWidget {
  static const String route_name='Login_screen';
  TextEditingController _emailController=TextEditingController();
  TextEditingController _passwordController=TextEditingController();

  void loginUser(String email , String password ,BuildContext context)async
  {
    currentUserState _currentuserState=Provider.of<currentUserState>(context,listen:false);

      if(await _currentuserState.loginUser(email, password))
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>home()), (route) => false);
      else{
        _displaySnackBar(context,'خطأ في ألايميل أو كلمة ألسر');
      }
  }
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    double heeght=MediaQuery.of(context).size.height;
    double weedth=MediaQuery.of(context).size.width;
    return Builder(
      builder: (context)=> Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            key: _scaffoldKey,
            appBar: AppBar(
              backgroundColor: Colors.green,
              title: GestureDetector(child: Text('أنشاء حساب ؟', style: TextStyle(fontFamily: 'Cairo', fontSize: 14.0),),
              onTap: (){Navigator.pushNamed(context, signup_screen.route_name);},),
            ),
            body: ListView(
              children:<Widget>[
                SizedBox(
                  height: heeght*0.2,
                ),
                Center(child: Text('تسجيل ألدخول',style: TextStyle(fontFamily:'Cairo' , color: Colors.black87,fontWeight: FontWeight.bold,fontSize: 25.0),)),
                SizedBox(
                  height: heeght*0.2,
                ),
                TextBox(heeght,0.07,'أدخل ألبريد ألالكتروني',Icons.lock,false,_emailController),
                SizedBox(
                  height: heeght*0.03,
                ),
                TextBox(heeght,0.07,'أدخل كلمة ألسر ألخاصه بك',Icons.lock,true,_passwordController),
                Padding(
                  padding: const EdgeInsets.only(top:12.0,left: 12.0,right:12.0),
                  child: RaisedButton(
                    color: Colors.green,
                      onPressed: ()
                      {
                        loginUser(_emailController.text, _passwordController.text, context) ;
                      },
                      child: Text('تسجيل ألدخول' , style: TextStyle(fontFamily: 'Cairo',color: Colors.white),),

                      ),
                )
              ],
            ),
          ),
        ),
    );
  }
  _displaySnackBar(BuildContext context , String Meesage) {
    final snackBar = SnackBar(content: Text(Meesage,style: TextStyle(fontFamily: 'Cairo'),),duration: Duration(seconds: 4),);
    _scaffoldKey.currentState.showSnackBar(snackBar);   // edited line
  }
}


