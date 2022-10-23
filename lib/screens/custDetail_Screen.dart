import 'package:flutter/material.dart';


class custDetail extends StatelessWidget {
  String custName;
  String custNumber;

  custDetail({this.custName,this.custNumber});

  @override
  Widget build(BuildContext context) {
    return Container(
      child:Column(
        children: [
          Text(custName),
          Text(custNumber),
        ],
      ),
    );
  }
}
