import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parkingapp/Core/Theme/ColorManager.dart';


class Customebutton extends StatelessWidget{
 final String text;
  final VoidCallback onpressed;
  const Customebutton(this.text,this.onpressed, {super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return SizedBox(
    width: double.infinity,
     height:55,
     child: ElevatedButton(
      style:ElevatedButton.styleFrom(
        backgroundColor:ColorManager.buttonColor,
        shape:RoundedRectangleBorder(
         
            borderRadius: BorderRadius.circular(12.r)
            
        )
      ),
     
       onPressed: onpressed, child: Text(text,style:TextStyle(
        fontSize: 16,
        color:ColorManager.primaryBG)),
     ),
   );
  }
}

