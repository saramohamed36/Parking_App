import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LegendItem extends StatelessWidget {
  final Color color;
  final String label;

  const LegendItem({super.key, required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 16.w,
          height: 16.h,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
         SizedBox(width: 6.w),
        Text(label, style:  TextStyle(fontSize: 14.sp)),
      ],
    );
  }
}
