import 'package:flutter/material.dart';

class BookingDetailRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final bool isValueBold;

  const BookingDetailRow({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    this.isValueBold = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 18, color: Colors.grey),
        SizedBox(width: 8),
        Text(label, style: const TextStyle(color: Colors.grey, fontSize: 13)),
        Spacer(),
        Text(
          value,
          style: TextStyle(
            fontSize: 13,
            fontWeight: isValueBold ? FontWeight.bold : FontWeight.w500,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
