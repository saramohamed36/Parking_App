import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class GarageCard extends StatelessWidget {
  final String name;
  final String distance;
  final VoidCallback? onTap; 

  const GarageCard({
    super.key,
    required this.name,
    required this.distance,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final levels = [
      {
        'title': 'Level 1',
        'value': '12/20',
        'bg': const Color(0xFFE7F8ED),
        'text': const Color(0xFF2E9B54),
      },
      {
        'title': 'Level 2',
        'value': '8/20',
        'bg': const Color(0xFFFFF3E0),
        'text': const Color(0xFFE08E1D),
      },
      {
        'title': 'Level 3',
        'value': '5/20',
        'bg': const Color(0xFFFDEBEC),
        'text': const Color(0xFFD9534F),
      },
    ];

    return GestureDetector(
      onTap:
          onTap ??
          () {
            
            context.push(
              '/bookingFormScreen',
            ); 
          },
      child: Container(
        padding:  EdgeInsets.all(14.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: const Color(0xFFEDEFF3)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding:  EdgeInsets.all(8.w),
                  decoration: BoxDecoration(
                    color: const Color(0xFFEFF3FF),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: const Icon(
                    Icons.local_parking,
                    color: Color(0xFF2E6BF2),
                  ),
                ),
                 SizedBox(width: 10.w),
                Expanded(
                  child: Text(
                    name,
                    style:  TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15.sp,
                    ),
                  ),
                ),
                Text(
                  distance,
                  style:  TextStyle(fontSize: 12.sp, color: Colors.grey),
                ),
              ],
            ),
             SizedBox(height: 12.h),
            Row(
              children: levels.map((level) {
                return Expanded(
                  child: Container(
                    margin:  EdgeInsets.symmetric(horizontal: 3.w),
                    padding:  EdgeInsets.symmetric(vertical: 8.h),
                    decoration: BoxDecoration(
                      color: level['bg'] as Color,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Column(
                      children: [
                        Text(
                          level['title'] as String,
                          style: TextStyle(
                            fontSize: 11.sp,
                            color: level['text'] as Color,
                          ),
                        ),
                         SizedBox(height: 2.h),
                        Text(
                          level['value'] as String,
                          style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.bold,
                            color: level['text'] as Color,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
