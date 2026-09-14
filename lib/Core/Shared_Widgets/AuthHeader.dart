
import 'package:flutter/material.dart';
import 'package:parkingapp/Core/Theme/ColorManager.dart';

class Authheader extends StatelessWidget{
  String title;
  String subtitle;
 Authheader({super.key, required this.title,required this.subtitle});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color:ColorManager.titleColor),),
        SizedBox(height: 10,),
        Text(subtitle,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400,color: ColorManager.subtitleColor),)
      ],
    );
  }

}