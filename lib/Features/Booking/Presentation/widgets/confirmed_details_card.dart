import 'package:flutter/material.dart';

import 'package:parkingapp/Features/Booking/Data/Models/booking_model.dart';
import 'package:parkingapp/Features/Booking/Presentation/widgets/booking_detail_row.dart';

class ConfirmedDetailsCard extends StatelessWidget {
  final BookingModel bookingModel;

  const ConfirmedDetailsCard({super.key, required this.bookingModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Icon(Icons.location_on, color: Colors.blue, size: 22),
              const SizedBox(width: 8),
              Text(
                bookingModel.garageName,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.blueAccent,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          BookingDetailRow(
            icon: Icons.calendar_today_outlined,
            label: "Date",
            value: bookingModel.date,
          ),
          const SizedBox(height: 12),

          BookingDetailRow(
            icon: Icons.access_time,
            label: "Time",
            value: bookingModel.time,
          ),
          const SizedBox(height: 12),

          BookingDetailRow(
            icon: Icons.directions_car_outlined,
            label: "Spot",
            value: bookingModel.spot,
          ),
          const SizedBox(height: 12),

          BookingDetailRow(
            icon: Icons.attach_money,
            label: "Total",
            value: bookingModel.totalPrice,
            isValueBold: true,
          ),
        ],
      ),
    );
  }
}
