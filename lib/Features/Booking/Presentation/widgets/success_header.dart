import 'package:flutter/material.dart';

class SuccessHeaderWidget extends StatelessWidget {
  const SuccessHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 36,
          backgroundColor: const Color(0xFF10B981),
          child: const Icon(Icons.check, size: 45, color: Colors.white),
        ),
        const SizedBox(height: 16),

        const Text(
          "Booking Confirmed!",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 8),

        const Text(
          "Your parking spot has been reserved\nand ready.",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 14, color: Colors.grey, height: 1.3),
        ),
      ],
    );
  }
}
