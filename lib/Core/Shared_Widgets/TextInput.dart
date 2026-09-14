import 'package:flutter/material.dart';
import 'package:parkingapp/Core/Theme/ColorManager.dart';

class Textinput extends StatelessWidget{
  String hinttext;
 Widget prefixicon;
  Widget ?postfixicon;
   bool isvisible;
   TextEditingController ?controller;
   Textinput({super.key, 
    required this.hinttext,
    required this.prefixicon,
    this.postfixicon,
    this.isvisible=true,
    this.controller
   });
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TextField(
     
      controller:controller,
      decoration:InputDecoration(
         fillColor:ColorManager.primaryBG,
      filled:true,
      contentPadding: EdgeInsets.symmetric(vertical: 20,horizontal: 20),
        hintText:hinttext,
        hintStyle:TextStyle(
          color:ColorManager.hintColor,
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 16, right: 10),
          child: SizedBox(
            height: 15,
            width: 15,
            child: FittedBox(
              fit: BoxFit.contain,
              child: prefixicon)),
        ),
        suffixIcon: Padding(
          padding: const EdgeInsets.only(left: 16, right: 10),
          child: SizedBox(
            height: 15,
            width: 15,
            child: FittedBox(
              fit: BoxFit.contain,
              child: postfixicon)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(
            color:ColorManager.hintColor,
            width: 1.0,
          )
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(
            color:ColorManager.buttonColor,
            width: 1.0,
          )
        )

      )

    );
  }
}