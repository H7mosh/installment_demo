import 'package:flutter/material.dart';
import 'package:installment_demo/module/customerModel.dart';
import 'package:installment_demo/screens/addCust.dart';
import 'package:installment_demo/screens/editCustScreen.dart';
import 'package:provider/provider.dart';
class custScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double heeght=MediaQuery.of(context).size.height;
    double weedth=MediaQuery.of(context).size.width;
    final custProviderInstance=Provider.of<List<Customers>>(context);

    return Scaffold(
      floatingActionButton: FloatingActionButton
       (
        onPressed: ()
        {
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>add_cust()));
        },
        backgroundColor: Colors.green,
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Text('ألزبائن',
          style: TextStyle(fontFamily: 'Cairo', fontWeight: FontWeight.bold),),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          (custProviderInstance != null)
          ? SizedBox(height: heeght*0.85,width:weedth,
            child: ListView.builder(
            itemCount: custProviderInstance.length,
            itemBuilder: (context,index)
            {
              return ListTile(
                    leading: InkWell(
                          onTap: (){
                            print( custProviderInstance[index].sponserName);
                            print("${custProviderInstance[index].idd}");
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => editCustScreen(
                                id:custProviderInstance[index].idd,
                                custName: custProviderInstance[index].custName,
                                custNumber: custProviderInstance[index].custNumber,
                                custAddress: custProviderInstance[index].custAddress,
                                sponsorName: custProviderInstance[index].sponserName,
                                sponsorNumber: custProviderInstance[index].sponserNumber,
                              )),
                            );},
                          child: Padding(
                            padding: const EdgeInsets.only(top:8.0),
                            child: CircleAvatar(
                              backgroundColor: Colors.green.withOpacity(0.5),
                              radius: 30,
                              child: Icon(Icons.build,color: Colors.black87,),
                            ),
                          ),
                      ),
                    isThreeLine: true,
                    title:  Directionality(
                          textDirection: TextDirection.rtl,
                          child: Text(custProviderInstance[index].custName??'defult',style: TextStyle(fontFamily: 'Cairo' , fontWeight: FontWeight.bold),)
                      ),
                    subtitle: Directionality(
                        textDirection: TextDirection.rtl,
                        child: Text(custProviderInstance[index].custNumber??'defult',style: TextStyle(fontFamily: 'Cairo'),)
                    ),
                    trailing: CircleAvatar(
                      backgroundColor:Colors.green,
                      radius: 10.5,
                    ),
                  );
            }),
          ):Center(child: CircularProgressIndicator()),
        ],
      )
      );
  }
}
