import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Data/models/BookingModel.dart';
import 'BookingCardTile.dart';

class HistoryBookingsBody extends StatelessWidget {
  final List<BookingModel> historyBookings;

  const HistoryBookingsBody({super.key, required this.historyBookings});

  @override
  Widget build(BuildContext context) {
    if (historyBookings.isEmpty) {
      return const Center(child: Text('No past bookings found'));
    }

    return ListView.builder(
      padding:  EdgeInsets.all(16.w),
      itemCount: historyBookings.length,
      itemBuilder: (context, index) {
        return BookingCardTile(booking: historyBookings[index]);
      },
    );
  }
}
