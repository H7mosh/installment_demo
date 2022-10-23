import 'package:flutter/material.dart';
import 'package:installment_demo/widdgets/usersView.dart';
import '../module/userModel.dart';

class userScreen extends StatelessWidget {
  final List<Users> installmentsUser=[
    Users(uid:'0',fullName: 'قاسم',Email: 'Akhel95@Gmail.com',Validity: 'أدمن'),
    Users(uid:'1',fullName: 'أحمد',Email: 'Ahmed@Gmail.com',Validity: 'مدير'),
    Users(uid:'2',fullName: 'ياسر',Email: 'yasser@Gmail.com',Validity: 'يوزر'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('ألمستخدمين',style: TextStyle(fontFamily: 'Cairo',fontWeight: FontWeight.bold),),
        backgroundColor: Colors.green,
      ),
      body:  Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                color: Colors.green.withOpacity(0.2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('ألصلاحيه',style: TextStyle(fontFamily: 'Cairo',fontWeight: FontWeight.bold),),
                    Text('ألايميل',style: TextStyle(fontFamily: 'Cairo',fontWeight: FontWeight.bold),),
                    Text('أسم ألمستخدم',style: TextStyle(fontFamily: 'Cairo',fontWeight: FontWeight.bold),),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Expanded(
                child: SizedBox(
                  height: 200.0,
                  child: ListView.separated(
                    scrollDirection: Axis.vertical,
                    separatorBuilder:(context,index)=>Divider(height:5,color: Colors.green,thickness: 1.0,),
                    itemCount: installmentsUser.length,
                    itemBuilder: (context,index){
                      return usersViewWidget(
                        username: installmentsUser[index].fullName,
                        email: installmentsUser[index].Email,
                        validatey: installmentsUser[index].Validity,
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      );
  }
}
