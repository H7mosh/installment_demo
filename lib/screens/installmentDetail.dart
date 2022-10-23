import 'package:flutter/material.dart';
import 'package:installment_demo/module/sellModule.dart';
import 'package:installment_demo/providers/addNewSell_Provider.dart';
import 'package:intl/intl.dart' as int1;
import 'package:provider/provider.dart';


class InstallmentDetail extends StatefulWidget {
  @override
  _InstallmentDetailState createState() => _InstallmentDetailState();
  SellModule sellModule;
  List list;
  InstallmentDetail({this.sellModule,this.list});
  String installState;
  String btn_text;
  AddNewSell addNewSellProvider;
  MaterialColor color;
}

class _InstallmentDetailState extends State<InstallmentDetail> {
  @override

  Widget build(BuildContext context) {
    double weedth=MediaQuery.of(context).size.width;
    double heeght=MediaQuery.of(context).size.height;
    widget.installState='لم يتم ألتعرف';
    widget.addNewSellProvider = Provider.of<AddNewSell>(context,listen: true);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          backgroundColor: Colors.white,
          body:Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: weedth,
                  height: heeght*0.5,
                  child:Column(
                    children: [
                      SizedBox(height: heeght*0.03,),
                      Padding(
                        padding: const EdgeInsets.only(bottom:8.0),
                        child: Container(
                          width: weedth*0.8,
                          height: heeght*0.09,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border(right: BorderSide(color: Colors.green,width: 5.0)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                blurRadius: 2.0,
                                spreadRadius:3.0,
                                offset: Offset(
                                  4.0,
                                  5.0,
                                ),
                              ),
                            ]
                          ),
                          child:Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(right:4.0),
                                child: Text('أسم ألزبون',style: TextStyle(color:Colors.green,fontFamily: 'Cairo'),),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right:5.0),
                               //child: Container(color: Colors.green,height: heeght*0.001,),
                                child: Text(widget.sellModule.custName,style: TextStyle(color:Colors.black87,fontWeight: FontWeight.bold,fontFamily: 'Cairo',fontSize: 17.0),),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom:8.0),
                        child: Container(
                          width: weedth*0.8,
                          height: heeght*0.08,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border(right: BorderSide(color: Colors.green,width: 5.0)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  blurRadius: 2.0,
                                  spreadRadius:3.0,
                                  offset: Offset(
                                    4.0,
                                    5.0,
                                  ),
                                ),
                              ]
                          ),
                          child:Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(right:4.0),
                                child: Text('نوع ألجهاز',style: TextStyle(color:Colors.green,fontFamily: 'Cairo'),),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right:5.0),
                                //child: Container(color: Colors.green,height: heeght*0.001,),
                                child: Text(widget.sellModule.deviceName,style: TextStyle(color:Colors.black87,fontWeight: FontWeight.bold,fontFamily: 'Cairo',fontSize: 17.0),),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom:8.0),
                        child: Container(
                          width: weedth*0.8,
                          height: heeght*0.08,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border(right: BorderSide(color: Colors.green,width: 5.0)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  blurRadius: 2.0,
                                  spreadRadius:3.0,
                                  offset: Offset(
                                    4.0,
                                    5.0,
                                  ),
                                ),
                              ]
                          ),
                          child:Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(right:4.0),
                                child: Text('سعر ألبيع ألكامل',style: TextStyle(color:Colors.green,fontFamily: 'Cairo'),),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right:5.0),
                                //child: Container(color: Colors.green,height: heeght*0.001,),
                                child: Text(widget.sellModule.fullPrice.toString(),style: TextStyle(color:Colors.black87,fontWeight: FontWeight.bold,fontFamily: 'Cairo',fontSize: 17.0),),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom:8.0),
                        child: Container(
                          width: weedth*0.8,
                          height: heeght*0.08,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border(right: BorderSide(color: Colors.green,width: 5.0)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  blurRadius: 2.0,
                                  spreadRadius:3.0,
                                  offset: Offset(
                                    4.0,
                                    5.0,
                                  ),
                                ),
                              ]
                          ),
                          child:Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(right:4.0),
                                child: Text('ألمدفوع مقدما',style: TextStyle(color:Colors.green,fontFamily: 'Cairo'),),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right:5.0),
                                //child: Container(color: Colors.green,height: heeght*0.001,),
                                child: Text(widget.sellModule.paidCash.toString(),style: TextStyle(color:Colors.black87,fontWeight: FontWeight.bold,fontFamily: 'Cairo',fontSize: 17.0),),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: weedth*0.8,
                        height: heeght*0.08,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border(right: BorderSide(color: Colors.green,width: 5.0)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                blurRadius: 2.0,
                                spreadRadius:3.0,
                                offset: Offset(
                                  4.0,
                                  5.0,
                                ),
                              ),
                            ]
                        ),
                        child:Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(right:4.0),
                              child: Text('سعر ألقسط ألواحد',style: TextStyle(color:Colors.green,fontFamily: 'Cairo'),),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right:5.0),
                              //child: Container(color: Colors.green,height: heeght*0.001,),
                              child: Text(widget.sellModule.oneInstallQty.toString(),style: TextStyle(color:Colors.black87,fontWeight: FontWeight.bold,fontFamily: 'Cairo',fontSize: 17.0),),
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
              Container(
                height: heeght*0.42,
                child: DraggableScrollableSheet(
                    builder: (BuildContext context, ScrollController scrollController)
                    {
                      return Container(
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(25),
                              topRight: Radius.circular(25),
                            )
                        ),
                        child:   ListView.builder(
                            controller: scrollController,
                            itemCount:widget.sellModule.installInfo.length,
                            itemBuilder: (context,index)
                            {
                              if (widget.sellModule.installInfo[index].IsPaid==true)
                              {
                                widget.installState='تم دفع ألقسط';
                                widget.btn_text='ألغاء ألتسديد';
                                widget.color=Colors.teal;
                              }
                              else {
                                widget.installState='لم يتم دفع ألقسط';
                                widget.btn_text='تسديد';
                                widget.color=Colors.red;
                              }
                              return ListTile(
                                leading:  CircleAvatar(
                                  backgroundColor: widget.color,
                                  radius: 22,
                                  child: CircleAvatar(
                                    radius: 20,
                                    backgroundColor: Colors.green.shade50,
                                    child: Text('${index+1}',style: TextStyle(fontFamily: 'Cairo',color: Colors.black87,fontSize: 18.0),),
                                  ),
                                ),
                                title:  Text(int1.DateFormat("dd MM yyyy").format(widget.sellModule.installInfo[index].installmentDate.toDate()),
                                  style: TextStyle(color: Colors.white),
                                ),
                                subtitle:Text(widget.installState,style: TextStyle(fontFamily: 'Cairo',color: Colors.white),),
                                trailing: FlatButton(color: Colors.white30,child: Text(widget.btn_text,style: TextStyle(fontFamily: 'Cairo',color: Colors.white,fontWeight: FontWeight.bold) ),
                                  onPressed: ()async
                                  {
                                    widget.sellModule.installInfo[index].IsPaid=!widget.sellModule.installInfo[index].IsPaid;
                                    List listee = List();
                                    widget.list.forEach((element) {
                                      listee.add(element.toMap());
                                    });
                                    await widget.addNewSellProvider.editSell(widget.sellModule ,listee,widget.sellModule.id);

                                    setState(() {
                                      widget.installState='تم دفع ألقسط';
                                      widget.btn_text='ألغاء ألتسديد';
                                    });
                                  },
                                ),
                              );
                            }
                          // children: [...installmentInformation
                        ),
                      );
                    }
                ),
              ),
            ],
          )
      ),
    );
  }
  }

