import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:installment_demo/providers/cust_provider.dart';
import 'package:installment_demo/providers/imagePicker.dart';
import 'package:provider/provider.dart';
import 'dart:io';
class add_cust extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var customerProvider=Provider.of<custProvider>(context);
    double heeght=MediaQuery.of(context).size.height;
    double weedth=MediaQuery.of(context).size.width;
   return  Directionality(
     textDirection: TextDirection.rtl,
     child: Scaffold(
         body: Container(
           height: heeght,
           width: weedth,
           child: SingleChildScrollView(
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 SizedBox(height: heeght*0.1,),
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Text(
                     'أضافة عميل', style: TextStyle(fontFamily: 'Cairo',fontWeight: FontWeight.bold,fontSize: 25),
                   ),
                 ),
                 SizedBox(height: heeght*0.04),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Padding(
                       padding: const EdgeInsets.only(right:8.0),
                       child: Icon(Icons.person,color: Colors.green,size:45,),
                     ),
                     Container(
                       height: heeght*0.1,
                       width: weedth*0.83,
                       child: Padding(
                         padding: const EdgeInsets.all(12.0),
                         child: TextFormField(
                           style: TextStyle(fontFamily: 'Cairo'),
                             onChanged: (value ){customerProvider.Change_custName(value);},
                             decoration: InputDecoration(
                                 filled: true,
                                 fillColor: Colors.green.withOpacity(0.2),
                                 hintStyle:TextStyle(fontFamily: 'Cairo',fontSize: 15.0),
                                 hintText: 'أسم ألعميل',
                                 focusedBorder: OutlineInputBorder(
                                     borderRadius:BorderRadius.all(Radius.elliptical(5.0, 5.0))
                                 )
                             )
                         ),
                       ),
                     ),
                   ],
                 ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Padding(
                       padding: const EdgeInsets.only(right:8.0),
                       child: Icon(Icons.phone,color: Colors.green,size:45,),
                     ),
                     Container(
                       height: heeght*0.1,
                       width: weedth*0.83,
                       child: Padding(
                         padding: const EdgeInsets.all(12.0),
                         child: TextFormField(
                             style: TextStyle(fontFamily: 'Cairo'),
                             onChanged: (value ){customerProvider.Change_custNumber(value);},
                             decoration: InputDecoration(
                                 filled: true,
                                 fillColor: Colors.green.withOpacity(0.2),
                                 hintStyle:TextStyle(fontFamily: 'Cairo',fontSize: 15.0),
                                 hintText: 'رقم ألتليفون',
                                 focusedBorder: OutlineInputBorder(
                                     borderRadius:BorderRadius.all(Radius.elliptical(5.0, 5.0))
                                 )
                             )
                         ),
                       ),
                     ),
                   ],
                 ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Padding(
                       padding: const EdgeInsets.only(right:8.0),
                       child: Icon(Icons.location_on,color: Colors.green,size:45,),
                     ),
                     Container(
                       height: heeght*0.1,
                       width: weedth*0.83,
                       child: Padding(
                         padding: const EdgeInsets.all(12.0),
                         child: TextFormField(
                             style: TextStyle(fontFamily: 'Cairo'),
                             onChanged: (value ){customerProvider.Change_custAddress(value);},
                             decoration: InputDecoration(
                                 filled: true,
                                 fillColor: Colors.green.withOpacity(0.2),
                                 hintStyle:TextStyle(fontFamily: 'Cairo',fontSize: 15.0),
                                 hintText: 'ألعنوان',
                                 focusedBorder: OutlineInputBorder(
                                     borderRadius:BorderRadius.all(Radius.elliptical(5.0, 5.0))
                                 )
                             )
                         ),
                       ),
                     ),
                   ],
                 ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Padding(
                       padding: const EdgeInsets.only(right:8.0),
                       child: Icon(Icons.person_pin,color: Colors.green,size:45,),
                     ),
                     Container(
                       height: heeght*0.1,
                       width: weedth*0.83,
                       child: Padding(
                         padding: const EdgeInsets.all(12.0),
                         child: TextFormField(
                             style: TextStyle(fontFamily: 'Cairo'),
                             onChanged: (value ){customerProvider.Change_sponsorName(value);},
                             decoration: InputDecoration(
                                 filled: true,
                                 fillColor: Colors.green.withOpacity(0.2),
                                 hintStyle:TextStyle(fontFamily: 'Cairo',fontSize: 15.0),
                                 hintText: 'أسم ألكفيل',
                                 focusedBorder: OutlineInputBorder(
                                     borderRadius:BorderRadius.all(Radius.elliptical(5.0, 5.0))
                                 )
                             )
                         ),
                       ),
                     ),
                   ],
                 ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Padding(
                       padding: const EdgeInsets.only(right:8.0),
                       child: Icon(Icons.phone,color: Colors.green,size:45,),
                     ),
                     Container(
                       height: heeght*0.1,
                       width: weedth*0.83,
                       child: Padding(
                         padding: const EdgeInsets.all(12.0),
                         child: TextFormField(
                             style: TextStyle(fontFamily: 'Cairo'),
                             onChanged: (value ){customerProvider.Change_sponsorNumber(value);},
                             decoration: InputDecoration(
                                 filled: true,
                                 fillColor: Colors.green.withOpacity(0.2),
                                 hintStyle:TextStyle(fontFamily: 'Cairo',fontSize: 15.0),
                                 hintText: 'رقم ألكفيل',
                                 focusedBorder: OutlineInputBorder(
                                     borderRadius:BorderRadius.all(Radius.elliptical(5.0, 5.0))
                                 )
                             )
                         ),
                       ),
                     ),
                   ],
                 ),
                 SizedBox(height: heeght*0.14,),
                 Center(
                   child: Container(
                     //color: Colors.indigo,
                     height: heeght*0.06,
                     width: weedth*0.8,
                     child: RaisedButton(
                         onPressed: ()async
                         {
                             await Provider.of<custProvider>(context,listen: false).saveCutomer();
                         },
                         color: Colors.green,
                         child: Text('حفظ',style: TextStyle(fontFamily: 'Cairo',color: Colors.white,fontWeight: FontWeight.bold),),
                     ),
                   ),
                 ),
               ],
             ),
           ),
         ),
     ),
   );
  }
}
