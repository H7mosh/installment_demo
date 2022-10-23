import 'package:flutter/material.dart';


class installmentPerview extends StatelessWidget {
  String custName;
  String fullPrice;
  String oneInstall;
  String sellDate;

  installmentPerview({@required this.custName,@required this.fullPrice,@required this.oneInstall,@required this.sellDate});
  @override
  Widget build(BuildContext context ) {
    double weedth=MediaQuery.of(context).size.width;
    double heeght=MediaQuery.of(context).size.height;
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top:8.0),
        child: Container(
          color: Colors.green,
          width: weedth*0.8,
          height: heeght*0.18,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                textDirection: TextDirection.rtl,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right:20.0,top: 10.0),
                    child: Text(": أسم ألزبون",style: TextStyle(fontFamily: 'Cairo',color: Colors.white,fontWeight: FontWeight.bold),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:140.0),
                    child: Text(custName,style: TextStyle(fontFamily: 'Cairo',color: Colors.white,backgroundColor:Colors.red),),
                  ),
                ],
              ),
              Row(
                textDirection: TextDirection.rtl,
                children: [
                   Text(": ألمبلغ ألكلي",style: TextStyle(fontFamily: 'Cairo',color: Colors.white),),
                   Text(fullPrice,style: TextStyle(fontFamily: 'Cairo',color: Colors.white),),
                ],
              ),
              Row(
                textDirection: TextDirection.rtl,
                children: [
                 Text(": مبلغ ألقسط ألواحد",style: TextStyle(fontFamily: 'Cairo',color: Colors.white),),
                 Text(oneInstall,style: TextStyle(fontFamily: 'Cairo',color: Colors.white),)
                ],
              ),
              Row(
                textDirection: TextDirection.rtl,
                children: [
                 Text(": تاريخ ألمبيعه",style: TextStyle(fontFamily: 'Cairo',color: Colors.white),),
                 Text(sellDate,style: TextStyle(fontFamily: 'Cairo',color: Colors.white),),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
