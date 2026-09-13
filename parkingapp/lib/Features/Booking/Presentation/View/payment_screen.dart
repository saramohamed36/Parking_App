import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:parkingapp/Features/Booking/Data/Models/booking_model.dart';
import 'package:parkingapp/Features/Booking/Presentation/Manager/booking_cubit.dart';
import 'package:parkingapp/Features/Booking/Presentation/widgets/payment_screen_body.dart';

class PaymentScreen extends StatelessWidget {
  final BookingModel bookingModel;

  const PaymentScreen({super.key, required this.bookingModel});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BookingCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Payment",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: PaymentScreenBody(bookingModel: bookingModel),
      ),
    );
  }
}