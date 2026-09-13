import 'package:flutter/material.dart';

import '../../Data/Models/booking_model.dart';
import 'booking_detail_row.dart';

class BookingsUpcomingItem extends StatelessWidget {
  final BookingModel booking;

  const BookingsUpcomingItem({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                booking.garageName,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.blueAccent,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: booking.isUpcoming
                      ? Colors.green.shade50
                      : Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  booking.isUpcoming ? "Upcoming" : "Completed",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: booking.isUpcoming
                        ? Colors.green
                        : Colors.grey.shade700,
                  ),
                ),
              ),
            ],
          ),
          const Divider(height: 24),

          BookingDetailRow(
            icon: Icons.calendar_today_outlined,
            label: "Date",
            value: booking.date,
          ),
          const SizedBox(height: 8),
          BookingDetailRow(
            icon: Icons.access_time,
            label: "Time",
            value: booking.time,
          ),
          const SizedBox(height: 8),
          BookingDetailRow(
            icon: Icons.directions_car_outlined,
            label: "Spot",
            value: booking.spot,
          ),
          const SizedBox(height: 8),
          BookingDetailRow(
            icon: Icons.attach_money,
            label: "Total",
            value: booking.totalPrice,
            isValueBold: true,
          ),
        ],
      ),
    );
  }
}
