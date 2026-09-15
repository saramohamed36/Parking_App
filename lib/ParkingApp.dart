
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parkingapp/Core/Routing/AppRouter.dart';

class Parkingapp extends StatelessWidget {
  const Parkingapp({super.key});

  @override
  Widget build(BuildContext context) {
    bool isWebOrDesktop = kIsWeb; 
    return ScreenUtilInit(
      designSize: isWebOrDesktop?const Size(1300, 1100):const Size(360, 690),
      ensureScreenSize: true,
      useInheritedMediaQuery: true,
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Parking App',
          routerConfig: AppRouter.router,
        );
      },
    );
  }
}
