import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parkingapp/Core/Theme/ColorManager.dart';

class UserInfoHeader extends StatelessWidget {
  final String name;
  final String email;

  const UserInfoHeader({Key? key, required this.name, required this.email})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    String firstLetter = name.trim().isNotEmpty
        ? name.trim()[0].toUpperCase()
        : 'U';

    return Row(
      children: [
        CircleAvatar(
          radius: 30.r,
          backgroundColor: Colors.blue.shade100,
          child: Text(
            firstLetter,
            style:  TextStyle(
              fontSize: 28.sp,
              fontWeight: FontWeight.bold,
              color: ColorManager.buttonColor,
            ),
          ),
        ),
         SizedBox(width: 16.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style:  TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
             SizedBox(height: 4.h),
            Text(
              email,
              style: TextStyle(fontSize: 14.sp, color: ColorManager.subtitleColor),
            ),
          ],
        ),
      ],
    );
  }
}
