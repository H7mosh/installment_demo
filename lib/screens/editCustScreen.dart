import 'package:flutter/material.dart';
import 'package:installment_demo/providers/cust_provider.dart';
import 'package:installment_demo/screens/cust_screen.dart';
import 'package:provider/provider.dart';
class editCustScreen extends StatefulWidget {
  String custName,custNumber,custAddress,sponsorName,sponsorNumber,id;
  editCustScreen({this.custName,this.custNumber,this.custAddress,this.sponsorName,this.sponsorNumber,this.id});
  @override
  _editCustScreenState createState() => _editCustScreenState();
}

class _editCustScreenState extends State<editCustScreen> {


  TextEditingController custnameController=new TextEditingController();
  TextEditingController custnumberController=new TextEditingController();
  TextEditingController custaddressController=new TextEditingController();
  TextEditingController sponsornameController=new TextEditingController();
  TextEditingController sponsorController=new TextEditingController();
  @override
  Widget build(BuildContext context ) {
    var customerProvider=Provider.of<custProvider>(context);
    double heeght=MediaQuery.of(context).size.height;
    double weedth=MediaQuery.of(context).size.width;
    return Directionality(
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
                    'تعديل معلومات ألعميل', style: TextStyle(fontFamily: 'Cairo',fontWeight: FontWeight.bold,fontSize: 20),
                  ),
                ),
                SizedBox(height: heeght*0.04),
                Row(
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
                          controller: custnameController,
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
                          controller: custnumberController,
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
                          controller: custaddressController,
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
                            controller: sponsornameController,
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
                          controller: sponsorController,
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
                SizedBox(height: heeght*0.10,),
                Center(
                  child: Container(
                    //color: Colors.indigo,
                    height: heeght*0.06,
                    width: weedth*0.8,
                    child: RaisedButton(
                      onPressed: ()async
                      {
                        customerProvider.Change_custName(custnameController.text);
                        customerProvider.Change_custNumber(custnumberController.text);
                        customerProvider.Change_custAddress(custaddressController.text);
                        customerProvider.Change_sponsorName(sponsornameController.text);
                        customerProvider.Change_sponsorNumber(sponsorController.text);
                        await Provider.of<custProvider>(context,listen: false).editCutomer(widget.id);
                      },
                      color: Colors.green,
                      child: Text('حفظ',style: TextStyle(fontFamily: 'Cairo',color: Colors.white,fontWeight: FontWeight.bold),),
                    ),
                  ),
                ),
                SizedBox(height: heeght*0.02,),
                Center(
                  child: Container(
                    //color: Colors.indigo,
                    height: heeght*0.06,
                    width: weedth*0.8,
                    child: RaisedButton(
                      onPressed: ()async{
                        await Provider.of<custProvider>(context,listen: false).deleteCutomer(widget.id);
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>custScreen()));
                      },
                      color: Colors.redAccent,
                      child: Text('حذف',style: TextStyle(fontFamily: 'Cairo',color: Colors.white,fontWeight: FontWeight.bold),),
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
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    custnameController.text=widget.custName;
    custnumberController.text=widget.custNumber;
    custaddressController.text=widget.custAddress;
    sponsornameController.text=widget.sponsorName;
    sponsorController.text=widget.sponsorNumber;
  }
}


