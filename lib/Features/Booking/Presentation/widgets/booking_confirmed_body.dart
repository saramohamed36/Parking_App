import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:parkingapp/Core/Routing/Routes.dart';

import 'package:parkingapp/Features/Booking/Data/Models/booking_model.dart';
import 'package:parkingapp/Features/Booking/Presentation/widgets/custom_button.dart';
import 'package:parkingapp/Features/Booking/Presentation/widgets/success_header.dart';
import 'package:parkingapp/Features/Booking/Presentation/widgets/confirmed_details_card.dart';

class BookingConfirmedBody extends StatelessWidget {
  final BookingModel bookingModel;

  const BookingConfirmedBody({super.key, required this.bookingModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
      child: Column(
        children: [
          const Spacer(),
          const SuccessHeaderWidget(),
          const SizedBox(height: 30),
          ConfirmedDetailsCard(bookingModel: bookingModel),
          const Spacer(),
          CustomButton(
            text: "View My Booking",
            backgroundColor: const Color(0xFF10B981),
            onPressed: () {
              context.go(Routes.myBookingScreen);
            },
          ),
          const SizedBox(height: 12),
          CustomButton(
            text: "Back to Home",
            isOutlined: true,
            onPressed: () {
              context.go(Routes.Garageoverviewscreen);
            },
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
