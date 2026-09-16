import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parkingapp/Core/Theme/ColorManager.dart';

class SelectTimeSection extends StatefulWidget {
  final Function(String selectedSlot) onTimeSelected;

  const SelectTimeSection({super.key, required this.onTimeSelected});

  @override
  State<SelectTimeSection> createState() => _SelectTimeSectionState();
}

class _SelectTimeSectionState extends State<SelectTimeSection> {
  String selectedSlot = 'Morning';

  Widget buildTimeCard(String title, String time) {
    bool isSelected = selectedSlot == title;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedSlot = title;
        });
        widget.onTimeSelected('$title ($time)');
      },
      child: Container(
        width: 100,
        padding:  EdgeInsets.symmetric(vertical: 12.h, horizontal: 8.w),
        decoration: BoxDecoration(
          color: isSelected ? ColorManager.buttonColor : Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: isSelected ? ColorManager.buttonColor : Colors.grey.shade300,
          ),
        ),
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: isSelected ? Colors.white : ColorManager.titleColor,
              ),
            ),
             SizedBox(height: 4.h),
            Text(
              time,
              style: TextStyle(
                fontSize: 10.sp,
                color: isSelected ? Colors.white : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Text(
          'Select Time (Day Only)',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: ColorManager.titleColor,
          ),
        ),
         SizedBox(height: 12.h),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildTimeCard('Morning', '6 AM - 12 PM'),
            buildTimeCard('Afternoon', '12 PM - 5 PM'),
            buildTimeCard('Evening', '5 PM - 10 PM'),
          ],
        ),

         SizedBox(height: 12.h),

        buildTimeCard('Night', '10 PM - 6 AM'),
      ],
    );
  }
}
