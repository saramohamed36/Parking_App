import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';

import 'package:parkingapp/Features/Booking/Data/Models/booking_model.dart';
import 'package:parkingapp/Features/Booking/Presentation/View/BookingConfirmedScreen.dart';
import 'package:parkingapp/Features/Booking/Presentation/View/My_Bookings/my_bookings_screen.dart';
import 'package:parkingapp/Features/Booking/Presentation/View/payment_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/BookingConfirmedScreen': (context) => const BookingConfirmedScreen(),
        '/my_bookings': (context) => const MyBookingsScreen(),
      },
      home: PaymentScreen(
        bookingModel: const BookingModel(
          garageName: "Central Garage",
          date: "12 Aug 2026",
          time: "10:00 AM - 12:00 PM",
          spot: "A-15",
          totalPrice: "25.0",
        ),
      ),
    ),
  );
}
