import 'package:flutter/material.dart';
import 'package:installment_demo/module/installmentInfo.dart';
import 'package:installment_demo/providers/addNewSell_Provider.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';
import 'package:uuid/uuid.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class installmentsView extends StatelessWidget {
  List list;
  DateTime date;
  installmentsView({this.list , this.date});
  AddNewSell addNewSell_Provider;
  @override
  Widget build(BuildContext context) {
     addNewSell_Provider = Provider.of<AddNewSell>(context);
    var installments= addNewSell_Provider.installmentInfo;
    installments = List();
    int installmentCount = 0;
    double weedth = MediaQuery.of(context).size.width;
    double heeght = MediaQuery.of(context).size.height;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        child: Icon(Icons.add_shopping_cart_rounded),
        onPressed: () async {
         await addNewSell_Provider.saveSell(list);
        },
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text('أقساط ألمبيعه',style: TextStyle(fontFamily: 'Cairo'),),
        backgroundColor: Colors.green,
      ),
      body: Container(
        height: heeght,
        width: weedth,
        child: ListView.builder(
            itemCount: addNewSell_Provider.installmentCount,
            itemBuilder: (context, index) {
              installmentCount++;
              return Padding(
                padding: const EdgeInsets.only(bottom:12.0 ,left: 8.0,right: 8.0,top: 8.0),
                 child:Container(
                   decoration: BoxDecoration(
                     color: Colors.green.shade50,
                       border: Border.all(color: Colors.green),
                       borderRadius: BorderRadius.all(
                         Radius.circular(10.0) //
                     ),
                   ),
                   child: Column(
                     children: [
                       Padding(
                         padding: const EdgeInsets.only(left:230.0),
                         child: Text('${index+1}'+'ألقسط رقم',style: TextStyle(fontFamily: 'Cairo'),),
                       ),
                        ListTile(
                         title: Text(
                           '${(addNewSell_Provider.fullPrice - addNewSell_Provider.paidCash) / addNewSell_Provider.installmentCount}' ,
                           style: TextStyle(fontFamily: 'Cairo',fontWeight: FontWeight.bold,color: Colors.black87),),

                         subtitle: Text(DateFormat('yyyy-MM-dd').format(Jiffy(date).add(months: index+1)), style: TextStyle(fontFamily: 'Cairo',color: Colors.black87)),
                       ),
                     ],
                   ),
                    ),
                 );
            }),
      ),
    );
  }
}
