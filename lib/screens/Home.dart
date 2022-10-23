import 'package:flutter/material.dart';
import 'package:installment_demo/providers/addNewSell_Provider.dart';
import 'package:installment_demo/screens/Login_screen.dart';
import 'package:installment_demo/screens/addNewSell.dart';
import 'package:installment_demo/screens/allInstallments.dart';
import 'package:installment_demo/screens/bad_record.dart';
import 'package:installment_demo/screens/cust_screen.dart';
import 'package:installment_demo/screens/root.dart';
import 'package:installment_demo/screens/users_screen.dart';
import 'package:installment_demo/widdgets/gridDashboard.dart';
import 'package:provider/provider.dart';
import '../providers/current_user.dart';
class home extends StatelessWidget {
  static const String route_name='Home_screen';
  @override
  Widget build(BuildContext context) {
    double heeght=MediaQuery.of(context).size.height;
    double weedth=MediaQuery.of(context).size.width;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white.withOpacity(0.98),
        body: SingleChildScrollView(
          child: Column(
            children:<Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:<Widget>[
                  Column(
                    children: <Widget>[
                     Padding(
                       padding: const EdgeInsets.only(right:24.0 , top: 40.0,bottom: 0.0),
                       child: Text('حموش أمين أحمد',style: TextStyle(fontFamily: 'Cairo',fontWeight: FontWeight.bold,color: Colors.black87,fontSize: 17.0),),
                     ),
                     Padding(
                        padding: const EdgeInsets.only(left: 70.0),
                        child: Text('أدمن',style: TextStyle(fontFamily: 'Cairo',fontWeight: FontWeight.bold,color: Colors.black87,fontSize: 14.0),),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:14.0),
                    child: RaisedButton(
                      onPressed: () async {
                      currentUserState _userState=Provider.of<currentUserState>(context,listen: false);
                      bool _returnString = await _userState.signOut();
                      if(_returnString == true)
                      {
                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>Login_screen()), (route) => false);
                      }
                    },
                      elevation: 0.0,
                    color: Colors.white.withOpacity(0.2),
                    child: Row(
                      children:<Widget>[
                        Text('تسجيل ألخروج',style: TextStyle(fontFamily:'Cairo',color:Colors.red),),
                        Icon(Icons.arrow_forward,size: 20,),
                      ]
                    ),
                    ),
                  ),
               ],
              ),
              SizedBox(
                height: heeght*0.05,
              ),
              Column(
                children:<Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children:<Widget>[
                      gridDashboard('assets/images/database.svg','كل ألاقساط',(){Navigator.push(context, MaterialPageRoute(builder: (context)=> allInstallments()));}),
                      gridDashboard('assets/images/man.svg', 'ألمستخدمين',(){Navigator.push(context, MaterialPageRoute(builder: (context)=>userScreen()));}),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children:<Widget>[
                      gridDashboard('assets/images/shopping-cart.svg','أضافة بيعه جديده',(){Navigator.push(context, MaterialPageRoute(builder: (context)=>AddNewSeller()));}),
                      gridDashboard('assets/images/user.svg', 'ألزبائن',(){Navigator.push(context, MaterialPageRoute(builder: (context)=>custScreen()));}),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children:<Widget>[
                      gridDashboard('assets/images/bad-review.svg','الاقساط ألمتعديه',(){Navigator.push(context, MaterialPageRoute(builder: (context)=>BadRecord()));}),
                      gridDashboard('assets/images/data-storage.svg','كل ألاقساط',(){}),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
