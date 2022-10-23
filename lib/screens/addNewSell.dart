import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:installment_demo/module/installmentInfo.dart';
import 'package:installment_demo/providers/addNewSell_Provider.dart';
import 'package:installment_demo/screens/installmentsView.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class AddNewSeller extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double OneInstallQty = 0;
    TextEditingController oneInstallController = new TextEditingController();
    oneInstallController.text=Provider.of<AddNewSell>(context).oneInstallQty.toString();
    double heeght=MediaQuery.of(context).size.height;
    double weedth=MediaQuery.of(context).size.width;
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd').format(now);
    var addNewSell_Provider=Provider.of<AddNewSell>(context,listen: false);
    return Scaffold(
      appBar:AppBar(title:
      Text(
          'أضافة بيعه جديده',style:TextStyle(fontFamily: 'Cairo')
         ),
        backgroundColor: Colors.green,
      ) ,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: heeght*0.1,
              width: weedth*0.83,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextFormField(
                    style: TextStyle(fontFamily: 'Cairo'),
                    onChanged: (value){
                      addNewSell_Provider.changeCustName(value);
                    },
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.green.withOpacity(0.2),
                        hintStyle:TextStyle(fontFamily: 'Cairo',fontSize: 15.0),
                        hintText: 'أسم ألزبون',
                        focusedBorder: OutlineInputBorder(
                            borderRadius:BorderRadius.all(Radius.elliptical(5.0, 5.0))
                        )
                    )
                ),
              ),
            ),
            Container(
              height: heeght*0.1,
              width: weedth*0.83,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextFormField(
                    style: TextStyle(fontFamily: 'Cairo'),
                    onChanged: (value ){addNewSell_Provider.changedeviceName(value);},
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.green.withOpacity(0.2),
                        hintStyle:TextStyle(fontFamily: 'Cairo',fontSize: 15.0),
                        hintText: 'ألجهاز ألمباع',
                        focusedBorder: OutlineInputBorder(
                            borderRadius:BorderRadius.all(Radius.elliptical(5.0, 5.0))
                        )
                    )
                ),
              ),
            ),
            Container(
              height: heeght*0.1,
              width: weedth*0.83,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextFormField(
                    style: TextStyle(fontFamily: 'Cairo'),
                    onChanged: (value ){addNewSell_Provider.changeFullPrice(double.parse(value));},
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.green.withOpacity(0.2),
                        hintStyle:TextStyle(fontFamily: 'Cairo',fontSize: 15.0),
                        hintText: 'ألمبلغ ألكلي',
                        focusedBorder: OutlineInputBorder(
                            borderRadius:BorderRadius.all(Radius.elliptical(5.0, 5.0))
                        )
                    )
                ),
              ),
            ),
            Container(
              height: heeght*0.1,
              width: weedth*0.83,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextFormField(
                    style: TextStyle(fontFamily: 'Cairo'),
                    onChanged: (value ){addNewSell_Provider.changePaidCash(double.parse(value));},
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.green.withOpacity(0.2),
                        hintStyle:TextStyle(fontFamily: 'Cairo',fontSize: 15.0),
                        hintText: 'ألمبلغ ألمدفوع مقدما',
                        focusedBorder: OutlineInputBorder(
                            borderRadius:BorderRadius.all(Radius.elliptical(5.0, 5.0))
                        )
                    )
                ),
              ),
            ),
            Container(
              height: heeght*0.1,
              width: weedth*0.83,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextFormField(
                    style: TextStyle(fontFamily: 'Cairo'),
                    onChanged: (value){
                      DateTime temp =  DateTime(int.parse(value.split("-")[0]),int.parse(value.split("-")[1]),int.parse(value.split("-")[2]));
                    addNewSell_Provider.changeSellDate(temp);},
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.green.withOpacity(0.2),
                        hintStyle:TextStyle(fontFamily: 'Cairo',fontSize: 15.0),
                        hintText: '${formattedDate}',
                        focusedBorder: OutlineInputBorder(
                            borderRadius:BorderRadius.all(Radius.elliptical(5.0, 5.0))
                        )
                    )
                ),
              ),
            ),
            Container(
              height: heeght*0.1,
              width: weedth*0.83,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextFormField(
                    style: TextStyle(fontFamily: 'Cairo'),
                    onChanged: (value ){
                      addNewSell_Provider.changeInstallmentCount(int.parse(value));
                      addNewSell_Provider.changeOneInstallQty();
                      //oneInstallConteroller.text=Provider.of<AddNewSell>(context,listen: false).oneInstallQty.toString();
                      },
                    onTap:(){},
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.green.withOpacity(0.2),
                        hintStyle:TextStyle(fontFamily: 'Cairo',fontSize: 15.0),
                        hintText: 'عدد ألاقساط',
                        focusedBorder: OutlineInputBorder(
                            borderRadius:BorderRadius.all(Radius.elliptical(5.0, 5.0))
                        )
                    )
                ),
              ),
            ),
            Container(
              height: heeght*0.1,
              width: weedth*0.83,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextFormField(
                 controller: oneInstallController,
                  onTap: (){print('THE ONE INSTALL COUNT IS : ${addNewSell_Provider.oneInstallQty}');},
                    style: TextStyle(fontFamily: 'Cairo'),
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.green.withOpacity(0.2),
                        hintStyle:TextStyle(fontFamily: 'Cairo',fontSize: 15.0),
                        hintText: 'مبلغ ألقسط ألواحد',
                        focusedBorder: OutlineInputBorder(
                            borderRadius:BorderRadius.all(Radius.elliptical(5.0, 5.0))
                        )
                    )
                ),
              ),
            ),
            Container(
              height: heeght*0.1,
              width: weedth*0.83,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextFormField(
                    onChanged: (value){addNewSell_Provider.changeNotes(value);},
                    style: TextStyle(fontFamily: 'Cairo'),
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.green.withOpacity(0.2),
                        hintStyle:TextStyle(fontFamily: 'Cairo',fontSize: 15.0),
                        hintText: 'ألملاحظات',
                        focusedBorder: OutlineInputBorder(
                            borderRadius:BorderRadius.all(Radius.elliptical(5.0, 5.0))
                        )
                    )
                ),
              ),
            ),
            Center(
              child: Container(
                //color: Colors.indigo,
                height: heeght*0.06,
                width: weedth*0.8,
                child: RaisedButton(
                  onPressed: ()async
                  {
                    print(addNewSell_Provider.installmentCount);
                    addNewSell_Provider.installmentInfo=List();
                    for (int i=1 ; i<= addNewSell_Provider.installmentCount;i++)
                    {
                      addNewSell_Provider.installmentInfo.add(
                              InstallmentInfo(
                                  installmentID: Uuid().v1(),
                                  IsPaid: false,
                                  installmentDate: Timestamp.fromMicrosecondsSinceEpoch(
                                      Jiffy(addNewSell_Provider.sellDate)
                                          .add(months: i)
                                          .microsecondsSinceEpoch)));
                    }

                    List list = List();
                    addNewSell_Provider.installmentInfo.forEach((element) {
                      list.add(element.toMap());
                    });
                     Navigator.push(context, MaterialPageRoute(builder: (context)=>installmentsView(list:list,date:addNewSell_Provider.sellDate,)));
                  },
                  color: Colors.green,
                  child: Text('حفظ',style: TextStyle(fontFamily: 'Cairo',color: Colors.white,fontWeight: FontWeight.bold),),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


}