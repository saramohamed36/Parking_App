import 'package:flutter/material.dart';

import 'package:parkingapp/Features/Booking/Presentation/widgets/booking_detail_row.dart'; // هتعملي import للـ Widget الجديد

class ConfirmedDetailsCard extends StatelessWidget {
  const ConfirmedDetailsCard({super.key});

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
          // عنوان الجراج
          const Row(
            children: [
              Icon(Icons.location_on, color: Colors.blue, size: 22),
              SizedBox(width: 8),
              Text(
                "Downtown Mall Garage",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.blueAccent,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // 1. التاريخ
          const BookingDetailRow(
            icon: Icons.calendar_today_outlined,
            label: "Date",
            value: "Mon, 12 May 2025",
          ),
          const SizedBox(height: 12),

          // 2. الوقت
          const BookingDetailRow(
            icon: Icons.access_time,
            label: "Time",
            value: "Morning (6 AM - 12 PM)",
          ),
          const SizedBox(height: 12),

          // 3. المكان
          const BookingDetailRow(
            icon: Icons.directions_car_outlined,
            label: "Spot",
            value: "Level 1 - B108",
          ),
          const SizedBox(height: 12),

          // 4. الإجمالي
          const BookingDetailRow(
            icon: Icons.attach_money,
            label: "Total",
            value: "\$15.60",
            isValueBold: true,
          ),
        ],
      ),
    );
  }
}
