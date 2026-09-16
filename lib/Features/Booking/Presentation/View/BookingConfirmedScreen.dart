import 'package:flutter/material.dart';
import 'package:parkingapp/Features/Booking/Data/Models/booking_model.dart';
import 'package:parkingapp/Features/Booking/Presentation/widgets/booking_confirmed_body.dart';

class BookingConfirmedScreen extends StatelessWidget {
  final BookingModel bookingModel;

  const BookingConfirmedScreen({super.key, required this.bookingModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: BookingConfirmedBody(bookingModel: bookingModel)),
    );
  }
}
