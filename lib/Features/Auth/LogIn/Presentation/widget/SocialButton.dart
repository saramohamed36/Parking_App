

import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';

import 'package:parkingapp/Core/Theme/ColorManager.dart';

class SocialButton extends StatelessWidget{
  String text;
  String image;
  VoidCallback onTap;
  SocialButton({required this.image,required this.text,required this.onTap});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
              return  
             ElevatedButton(
              onPressed:onTap,
        
                      style:  ElevatedButton.styleFrom(
                          backgroundColor: ColorManager.primaryBG,
                          elevation: 0,
                          side: BorderSide(
                            width: 1,
                            color: ColorManager.hintColor,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(14)
                          )
                        ),
                         child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(image),
                            SizedBox(width: 12),
                            Text(text,style: TextStyle(
                              fontSize: 15,
                             fontWeight: FontWeight.w600,
                              color: ColorManager.titleColor
                            ),),
                          ],
                         ));
  }
}