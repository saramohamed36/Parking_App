import 'package:flutter/material.dart';

import 'package:parkingapp/Features/Booking/Presentation/widgets/custom_button.dart';
import 'package:parkingapp/Features/Booking/Presentation/widgets/success_header.dart';
import 'package:parkingapp/Features/Booking/Presentation/widgets/confirmed_details_card.dart';

class BookingConfirmedBody extends StatelessWidget {
  const BookingConfirmedBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
      child: Column(
        children: [
          Spacer(),
          SuccessHeaderWidget(),
          SizedBox(height: 30),
          ConfirmedDetailsCard(),
          Spacer(),
          CustomButton(
            text: "View My Booking",
            backgroundColor: const Color(0xFF10B981),
            onPressed: () {
              Navigator.pushNamed(context, '/my_bookings');
            },
          ),

          SizedBox(height: 12),

          CustomButton(
            text: "Back to Home",
            isOutlined: true,
            onPressed: () {
              Navigator.popUntil(context, (route) => route.isFirst);
            },
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
