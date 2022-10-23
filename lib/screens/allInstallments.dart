import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:installment_demo/module/installmentInfo.dart';
import 'package:installment_demo/module/sellModule.dart';
import 'package:installment_demo/screens/installmentDetail.dart';
import 'package:intl/intl.dart' as intl;
import 'package:provider/provider.dart';

import 'installmentDetail.dart';

class allInstallments extends StatefulWidget {

  @override
  _allInstallmentsState createState() => _allInstallmentsState();
}

class _allInstallmentsState extends State<allInstallments> {
  @override
  Widget build(BuildContext context) {
    final List<SellModule> allInstallmentsProviderInstance= Provider.of<List<SellModule>>(context , listen:false);
    TextEditingController _searchController= TextEditingController();
    double heeght=MediaQuery.of(context).size.height;
    List<SellModule>sellList=List();
    List _filteredList=List();

     @override
    void initState() async{
    super.initState();
       setState(() {

       });
    }


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Text('كل المبيعات',style: TextStyle(fontFamily: 'Cairo'),),
      ),
      body:StreamBuilder<QuerySnapshot> (
        stream: FirebaseFirestore.instance.collection('sellSomeThing').snapshots(),
        builder: (context,  AsyncSnapshot<QuerySnapshot>snapshot) {
          if(!snapshot.hasData){
              return Center(child: CircularProgressIndicator());
          }
          return Directionality(
            textDirection: TextDirection.rtl,
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    onChanged: (value)
                    {
                      setState(() {

                      });
                    },
                     controller: _searchController,
                     decoration: InputDecoration(
                       focusedBorder: OutlineInputBorder(
                         borderSide: BorderSide(
                             color: Colors.green, width: 1.0),
                       ),
                       suffixIcon: Icon(Icons.search,color: Colors.green,),
                     ),
                  ),
                ),
                Container(
                  height: heeght*0.78,
                  child: ListView.builder(
                        itemCount: snapshot.data.docs.length,
                        itemBuilder: (context,index)
                        {
                          DocumentSnapshot selles=snapshot.data.docs[index];
                          Timestamp timestamp=selles['sellDate'];
                          DateTime date=timestamp.toDate();
                          String formattedDate=intl.DateFormat('yyyy-MM-dd').format(date);
                          return SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.green.shade50,
                                  border: Border.all(color: Colors.green),
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(8.0) //
                                  ),
                                ),
                                child: ListTile(
                                  onTap: (){

                                    List<InstallmentInfo> temp = [];
                                    List list=selles.data()['array'];
                                    list.forEach((element) {
                                      temp.add(InstallmentInfo.fromFirestore(element));
                                    });
                                    for(int i=0;i<selles['installmentCount'];i++)
                                    {
                                      print('${i} ${list[i]['install_Date']} ${selles.data()['custName']}');
                                    }
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>InstallmentDetail(sellModule:
                                  SellModule(
                                      installInfo:temp,
                                      paidCash: selles.data()['paidCash'] ?? 0.0,
                                      id: selles.id ?? "",
                                      sellModuleId: selles.data()['sellModuleId'] ?? "",
                                      sellDate: selles.data()['sellDate']??'',
                                  oneInstallQty: selles.data()['oneInstallQty']??'',
                                  fullPrice: selles.data()['fullPrice']??'',
                                    installmentCount: selles.data()['installmentCount']??'',
                                    custName: selles.data()['custName']??'',
                                    deviceName: selles.data()['deviceName']??'',
                                      ),list:temp,
                                    ), ));
                                    },
                                  leading:CircleAvatar(
                                    backgroundColor: Colors.green,
                                    child: Text('$index',style: TextStyle(fontFamily: 'Cairo',color: Colors.white,fontWeight: FontWeight.bold),),
                                  ),
                                    title: Text(selles['deviceName'],style: TextStyle(fontFamily: 'Cairo',fontWeight: FontWeight.bold)),
                                  subtitle: Text(selles['custName'],style: TextStyle(fontFamily: 'Cairo'),),
                                  ),
                              ),
                            ),
                          );
                        }
                    ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}


