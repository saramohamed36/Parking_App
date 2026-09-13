import 'package:flutter/material.dart';

import 'package:parkingapp/Features/Booking/Data/Models/booking_model.dart';
import 'BookingSummaryItem.dart';

class BookingSummaryCard extends StatelessWidget {
  final BookingModel bookingModel;
  const BookingSummaryCard({super.key, required this.bookingModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Booking Summary",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 12),
          BookingSummaryItem(
            icon: Icons.local_parking,
            label: "Garage",
            value: bookingModel.garageName,
          ),
          BookingSummaryItem(
            icon: Icons.calendar_today,
            label: "Date",
            value: bookingModel.date,
          ),
          BookingSummaryItem(
            icon: Icons.access_time,
            label: "Time",
            value: bookingModel.time,
          ),
          BookingSummaryItem(
            icon: Icons.directions_car,
            label: "Spot",
            value: bookingModel.spot,
          ),
          const Divider(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Total",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Text(
                "\$${bookingModel.totalPrice}",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}