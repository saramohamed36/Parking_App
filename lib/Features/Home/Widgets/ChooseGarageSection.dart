import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parkingapp/Core/Theme/ColorManager.dart';

class ChooseGarageSection extends StatefulWidget {
  final Function(String garageName) onGarageSelected;

  const ChooseGarageSection({super.key, required this.onGarageSelected});

  @override
  State<ChooseGarageSection> createState() => _ChooseGarageSectionState();
}

class _ChooseGarageSectionState extends State<ChooseGarageSection> {
  String selectedGarage = 'Downtown Mall Garage';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Text(
          'Choose Garage',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: ColorManager.titleColor,
          ),
        ),
         SizedBox(height: 10.h),
        Container(
          padding: EdgeInsets.symmetric(
  horizontal: 12.w,
  vertical: 4.h,
),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: selectedGarage,
              isExpanded: true,
              icon:  Icon(
                Icons.arrow_forward_ios,
                size: 16.sp,
                color: Colors.grey,
              ),
              items: const [
                DropdownMenuItem(
                  value: 'Downtown Mall Garage',
                  child: Text(
                    'Downtown Mall Garage (1.2 km)',
                    style: TextStyle(color: ColorManager.titleColor),
                  ),
                ),
                DropdownMenuItem(
                  value: 'City Center Garage',
                  child: Text(
                    'City Center Garage (2.5 km)',
                    style: TextStyle(color: ColorManager.titleColor),
                  ),
                ),
                DropdownMenuItem(
                  value: 'Grand Square Parking',
                  child: Text(
                    'Grand Square Parking (3.8 km)',
                    style: TextStyle(color: ColorManager.titleColor),
                  ),
                ),
              ],
              onChanged: (newValue) {
                if (newValue != null) {
                  setState(() {
                    selectedGarage = newValue;
                  });
                  widget.onGarageSelected(newValue);
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
