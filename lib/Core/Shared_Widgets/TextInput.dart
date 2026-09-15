import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parkingapp/Core/Theme/ColorManager.dart';

class Textinput extends StatelessWidget{
  String hinttext;
 Widget prefixicon;
  Widget ?postfixicon;
   bool isvisible;
   TextEditingController ?controller;
   Textinput({
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
      contentPadding: EdgeInsets.symmetric(vertical: 20.h,horizontal: 20.w),
        hintText:hinttext,
        hintStyle:TextStyle(
          color:ColorManager.hintColor,
        ),
        prefixIcon: Padding(
          padding:  EdgeInsets.only(left: 16.w, right: 10.w),
          child: SizedBox(
            height: 15.h,
            width: 15.w,
            child: FittedBox(
              fit: BoxFit.contain,
              child: prefixicon)),
        ),
        suffixIcon: Padding(
          padding:  EdgeInsets.only(left: 16.w, right: 10.w),
          child: SizedBox(
            height: 15.h,
            width: 15.w,
            child: FittedBox(
              fit: BoxFit.contain,
              child: postfixicon)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.r),
          borderSide: BorderSide(
            color:ColorManager.hintColor,
            width: 1.w,
          )
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.r),
          borderSide: BorderSide(
            color:ColorManager.buttonColor,
            width: 1.w,
          )
        )

      )

    );
  }
}