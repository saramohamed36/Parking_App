import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parkingapp/Core/Theme/ColorManager.dart';

class ProfileOptionTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback? onTap;
  final bool isLogOut;

  const ProfileOptionTile({
    Key? key,
    required this.icon,
    required this.title,
    this.onTap,
    this.isLogOut = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color mainColor = isLogOut
        ? Colors.red.shade400
        : ColorManager.buttonColor;
    final Color textColor = isLogOut ? Colors.red.shade400 : Colors.black87;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 8.r,
           offset: Offset(0, 2.h),
          ),
        ],
      ),
      child: ListTile(
        onTap: onTap,
        contentPadding:  EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
        leading: Icon(icon, color: mainColor, size: 24.sp),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: textColor,
          ),
        ),
        trailing: isLogOut
            ? null
            :  Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.grey,
                size: 16.sp,
              ),
      ),
    );
  }
}
