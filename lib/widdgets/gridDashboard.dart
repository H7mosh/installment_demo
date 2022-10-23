import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class gridDashboard extends StatelessWidget {
  String svgUrl;
  String mainText;
  Function onGridTap;
  gridDashboard(@required String svgUrl , @required String mainText , this.onGridTap)
  {
    this.svgUrl=svgUrl;
    this.mainText=mainText;
  }
  @override
  Widget build(BuildContext context) {
    double heeght=MediaQuery.of(context).size.height;
    double weedth=MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onGridTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: heeght*0.22,
          width: weedth*0.42,
          child: Card(
            elevation: 0.4,
            color: Colors.white70,
            child: Column(
              children:<Widget>[
                 Padding(
                   padding: const EdgeInsets.all(5.0),
                   child: SvgPicture.asset(svgUrl,height:heeght*0.12 , width: weedth*0.20),
                 ),
                Text(mainText,style: TextStyle(fontFamily: 'Cairo',fontWeight: FontWeight.bold,fontSize: 16.0,color: Colors.black),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
