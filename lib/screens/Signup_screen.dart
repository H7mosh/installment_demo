import 'package:flutter/material.dart';
import 'package:installment_demo/providers/current_user.dart';
import 'package:installment_demo/providers/dropDownProvider.dart';
import 'package:installment_demo/screens/Home.dart';
import 'package:installment_demo/screens/Login_screen.dart';
import 'package:installment_demo/widdgets/Textbox.dart';
import 'package:provider/provider.dart';

class signup_screen extends StatelessWidget {
  static const String route_name='signup_screen';
  TextEditingController _nameController=TextEditingController();
  TextEditingController _emailController=TextEditingController();
  TextEditingController _passwordController=TextEditingController();
  TextEditingController _confrmpasswordController=TextEditingController();
  String selectedValue;
  void signup_User(String email,String passsword,String fullname , String validity ,BuildContext ctx)async //To Check The Result Of The SignUp Method That In The Current User Provider
  {
    currentUserState _userState=Provider.of<currentUserState>(ctx , listen: false);
    try{
      if (await _userState.signupUser(email, passsword ,fullname,validity) == true)
      {
        Navigator.pushAndRemoveUntil(ctx, MaterialPageRoute(builder: (context)=>Login_screen()), (route) => false);
      }
    }catch(e)
    {
      print('The Error 2 Is : '+e);
    }
  }
  @override
  Widget build(BuildContext context) {
    double heeght=MediaQuery.of(context).size.height;
    double weedth=MediaQuery.of(context).size.width;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text('تسجيل ألدخول ؟',style: TextStyle(fontFamily: 'Cairo',fontSize: 14.0),),
        ),
        body: ListView(
            children: <Widget>[
              SizedBox(
                height: heeght*0.02,
              ),
              Padding(
               padding: const EdgeInsets.only(right:12.0),
               child: Text('أنشاء حساب جديد',style: TextStyle(fontFamily:'Cairo' , color: Colors.black87,fontWeight: FontWeight.bold,fontSize: 25.0),),
             ),
              SizedBox(
                height: heeght*0.03,
              ),
              TextBox(heeght,0.07,'أدخل أسمك',Icons.person,false,_nameController),
              SizedBox(
                height: heeght*0.03,
              ),
              TextBox(heeght,0.07,'أدخل ألبريد ألالكتروني',Icons.lock,false,_emailController),
              SizedBox(
                height: heeght*0.03,
              ),
              TextBox(heeght,0.07,'أدخل كلمة ألسر ألخاصه بك',Icons.lock,true,_passwordController),
              SizedBox(
                height: heeght*0.03,
              ),
              TextBox(heeght,0.07,'أعد كتابة كلمة ألسر',Icons.lock,true,_confrmpasswordController),
              SizedBox(
                height: heeght*0.03,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: EdgeInsets.only(left: 16.0 , right: 16.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.0),
                    border: Border.all(
                      color: Colors.black87,
                    ),
                  ),
                  child: DropdownButton<String>(
                    isExpanded: true,
                    dropdownColor: Colors.green,
                    hint:Text('data') ,
                    items: ['مستخدم','أدمن','مدير'].map((String value)
                    {
                      return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value,style: TextStyle(fontFamily: 'Cairo' , color: Colors.black87),)
                      );
                    }).toList(),
                    onChanged: (String value){
                      var val=Provider.of<dropDownProvider>(context,listen: false);
                      val.ChangeMenuItem(value);
                    },
                    value:Provider.of<dropDownProvider>(context,listen: false).selectedValue,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:12.0,left: 12.0,right:12.0),
                child: RaisedButton(
                  color: Colors.green,
                  onPressed: ()
                  {

                    if(_passwordController.text == _confrmpasswordController.text)
                    {
                      signup_User(_emailController.text, _passwordController.text,_nameController.text,Provider.of<dropDownProvider>(context,listen: false).selectedValue, context);
                    }
                    else 
                    {
                        Scaffold.of(context).showSnackBar(
                          SnackBar(content:  Text('كلمات ألسر غير متطابقه',style: TextStyle(fontFamily: 'Cairo'),),
                          duration: Duration(seconds: 5),
                          )
                        );
                    }
                  },
                  child: Text('أنشاء حساب' , style: TextStyle(fontFamily: 'Cairo',color: Colors.white),),
                ),
              ),
            ],
          ),
        ),
    );
  }
}
