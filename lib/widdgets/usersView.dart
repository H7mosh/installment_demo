import 'package:flutter/material.dart';

class usersViewWidget extends StatelessWidget {
  String username;
  String email;
  String validatey;

  usersViewWidget({this.username,this.email,this.validatey});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child:Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(validatey,style: TextStyle(fontFamily: 'Cairo',fontWeight: FontWeight.bold),),
            Text(email,style: TextStyle(fontFamily: 'Cairo',fontWeight: FontWeight.bold),),
            Text(username,style: TextStyle(fontFamily: 'Cairo',fontWeight: FontWeight.bold),),
          ],
        ),
      ),
    );
  }
}
