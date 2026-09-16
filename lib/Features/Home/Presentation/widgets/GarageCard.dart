import 'package:flutter/material.dart';

class GarageCard extends StatelessWidget {
  final String name;
  final String distance;

  const GarageCard({super.key, required this.name, required this.distance});

  @override
  Widget build(BuildContext context) {
    final levels = [
      {
        'title': 'Level 1',
        'value': '12/20',
        'bg': const Color(0xFFE7F8ED),
        'text': const Color(0xFF2E9B54),
      },
      {
        'title': 'Level 2',
        'value': '8/20',
        'bg': const Color(0xFFFFF3E0),
        'text': const Color(0xFFE08E1D),
      },
      {
        'title': 'Level 3',
        'value': '5/20',
        'bg': const Color(0xFFFDEBEC),
        'text': const Color(0xFFD9534F),
      },
    ];

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFEDEFF3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(0xFFEFF3FF),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.local_parking,
                  color: Color(0xFF2E6BF2),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  name, 
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                ),
              ),
              Text(
                distance, 
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: levels.map((level) {
              return Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 3),
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                    color: level['bg'] as Color,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Text(
                        level['title'] as String,
                        style: TextStyle(
                          fontSize: 11,
                          color: level['text'] as Color,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        level['value'] as String,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: level['text'] as Color,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
