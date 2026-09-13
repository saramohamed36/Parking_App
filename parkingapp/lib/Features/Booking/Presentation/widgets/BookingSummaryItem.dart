import 'package:flutter/material.dart';

class BookingSummaryItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  const BookingSummaryItem({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(icon, size: 18, color: Colors.grey),
          SizedBox(width: 8),
          Text(label, style: TextStyle(color: Colors.grey)),
          Spacer(),
          Text(value, style: TextStyle(fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}
