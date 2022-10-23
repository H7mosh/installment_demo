import 'package:flutter/material.dart';


class TextBox extends StatelessWidget {
  final double heeght;
  final double minusheeght;
  final String hintText;
  final IconData icon;
  final bool _ispassword;
  TextEditingController _controller;
  TextBox(@required this.heeght ,@required this.minusheeght,@required this.hintText,this.icon,this._ispassword , this._controller);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:12.0),
      child: Container(
        height:heeght*minusheeght,
        child: TextFormField(
          obscureText: _ispassword,
          controller: _controller,
          decoration:InputDecoration(
              filled: true,
              fillColor: Colors.black12,
              hintText: hintText,
              hintStyle:TextStyle(fontFamily: 'Cairo',fontSize: 15.0),
              prefixIcon:Icon(icon),
              border: OutlineInputBorder(
                  borderRadius:BorderRadius.all(Radius.circular(35.0))
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius:BorderRadius.all(Radius.elliptical(5.0, 5.0))
              )
          ),
        ),
      ),
    );
  }
}