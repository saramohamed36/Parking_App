import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parkingapp/Features/MyBooking/Data/models/BookingModel.dart';

import 'BookingCardTile.dart';

class UpcomingBookingsBody extends StatelessWidget {
  final List<BookingModel> upcomingBookings;

  const UpcomingBookingsBody({super.key, required this.upcomingBookings});

  @override
  Widget build(BuildContext context) {
    if (upcomingBookings.isEmpty) {
      return const Center(child: Text("No upcoming bookings found"));
    }

    return ListView.builder(
      padding:  EdgeInsets.all(16.w),
      itemCount: upcomingBookings.length,
      itemBuilder: (context, index) {
        final booking = upcomingBookings[index];
        return BookingCardTile(booking: booking, onTap: () {});
      },
    );
  }
}
