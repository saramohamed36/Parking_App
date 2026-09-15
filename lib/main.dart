
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:parkingapp/Core/model/User_Model.dart';
import 'package:parkingapp/ParkingApp.dart';
import 'package:parkingapp/firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
   await Hive.initFlutter();
   Hive.registerAdapter(UserModelAdapter());
  await Hive.openBox("UserSignUp");
  await Hive.openBox("UserLogin");
  await Hive.openBox("UserFirstLogin");

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await ScreenUtil.ensureScreenSize();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  runApp(const Parkingapp());
}
