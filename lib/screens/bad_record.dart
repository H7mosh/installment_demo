import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as int1;

class BadRecord extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Stream<QuerySnapshot> courseDocStream = FirebaseFirestore.instance.collection('sellSomeThing').snapshots();
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: Text('ألاقساط ألمنتهيه',style: TextStyle(fontFamily: 'Cairo'),),
          backgroundColor: Colors.red,
        ),
        body:SafeArea(
          child: Center(
            child: StreamBuilder<QuerySnapshot>(
              stream: courseDocStream,
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot)
              {
                if(!snapshot.hasData){ //this one ?e kkkt
                  return Center(child: CircularProgressIndicator());
                }
                final items = snapshot.data.docs.reversed;
                List<InfoContainer> addedItems =[];
                var newDate;
                var isPaid;
                var custName;
                var installmentCount;
                var deviceName;
                var bubleitem;
                for(var item in items) {
                  Timestamp installDate = (item
                      .data()['array'][0]['install_Date']);
                  final date = int1.DateFormat('yyyy-MM-dd').format(installDate.toDate());
                  isPaid = item.data()['array'][0]['isPaid'];
                  newDate = DateTime.parse(date);
                  custName=item.data()['custName'];
                  deviceName=item.data()['deviceName'];
                  installmentCount=item.data()['oneInstallQty'];
                  if (!isPaid && newDate.isBefore(DateTime.now())) {
                    bubleitem = InfoContainer(
                      deviceName: deviceName,
                      installmentCount: installmentCount,
                      custName: custName,
                      date: newDate,
                      paid: isPaid,
                    );
                    addedItems.add(bubleitem);
                    print(addedItems.first.paid);
                  }
                }
              return Container(
                child: ListView(
                 children: addedItems, //messenger plz
                ),
              );
              }
              //حضرتك المفروض نجيب
            ),
          ),
        ),
    );
  }
}

class InfoContainer extends StatelessWidget {
 final bool paid;
 final DateTime date;
 final custName;
 final deviceName;
 final installmentCount;

 InfoContainer({this.paid, this.date,this.custName,this.deviceName,this.installmentCount});

  @override
  Widget build(BuildContext context) {
   if (paid == false) {
     return Directionality(
       textDirection: TextDirection.rtl,
       child: Container(
         height: 120,
         margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
         decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(15),
         ),
         child: Container(
           decoration: BoxDecoration(
             color: Colors.white,
            border: Border.all(color: Colors.red),
            borderRadius: BorderRadius.all(
               Radius.circular(8.0) //
           ),
         ),
           child: Padding(
             padding: const EdgeInsets.only(right:8.0,top: 8.0),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Text('$custName',style: TextStyle(fontFamily: 'Cairo'),),
                 Text(date.toString(),style: TextStyle(fontFamily: 'Cairo'),),
                 Text(deviceName,style: TextStyle(fontFamily: 'Cairo'),),
                 Text(installmentCount.toString(),style: TextStyle(fontFamily: 'Cairo'),),
               ],
             ),
           ),
         ),
       ),
     );
   }
  }
}

