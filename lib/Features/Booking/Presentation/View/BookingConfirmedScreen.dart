import 'package:flutter/material.dart';
import 'package:parkingapp/Features/Booking/Presentation/widgets/booking_confirmed_body.dart';

class BookingConfirmedScreen extends StatelessWidget {
  const BookingConfirmedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: BookingConfirmedBody()),
    );
  }
}
