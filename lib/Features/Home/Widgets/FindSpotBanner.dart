import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parkingapp/Core/Theme/AppAssets.dart';

class FindSpotBanner extends StatelessWidget {
  const FindSpotBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.r),
      child: Image.asset(
        Appassets.homeImage,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}
