import 'package:flutter/material.dart';
import 'package:parkingapp/Features/Home/Widgets/legend_item.dart';
import 'package:parkingapp/Features/Home/Widgets/spot_details.dart';

class ParkingSpotScreen extends StatefulWidget {
  final String garageName;
  final String garageDistance;
  final String date;
  final String time;

  const ParkingSpotScreen({
    super.key,
    required this.garageName,
    required this.garageDistance,
    required this.date,
    required this.time,
  });

  @override
  State<ParkingSpotScreen> createState() => _ParkingSpotScreenState();
}

class _ParkingSpotScreenState extends State<ParkingSpotScreen> {
  final List<Map<String, dynamic>> spots = List.generate(20, (index) {
    int spotNumber = 101 + index;
    return {
      "id": spotNumber,
      "status":
          (spotNumber == 103 ||
              spotNumber == 108 ||
              spotNumber == 113 ||
              spotNumber == 114)
          ? "Occupied"
          : (spotNumber == 117 || spotNumber == 120)
          ? "Unavailable"
          : "Available",
      "level": "Level 1",
      "row": "Row B",
    };
  });

  int? selectedSpot;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Parking Spots",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
      ),
      body: Column(
        children: [
          // Garage info card (Dynamic)
          Container(
            margin: EdgeInsets.all(screenWidth * 0.04),
            padding: EdgeInsets.all(screenWidth * 0.04),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 6,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              children: [
                Icon(
                  Icons.directions_car,
                  size: screenWidth * 0.1,
                  color: Colors.green,
                ),
                SizedBox(width: screenWidth * 0.03),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.garageName,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Text(
                      "Level 1",
                      style: TextStyle(fontSize: 14, color: Colors.black54),
                    ),
                  ],
                ),
                const Spacer(),
                Text(
                  widget.garageDistance,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),

          // Legend row
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.04,
              vertical: screenWidth * 0.02,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                LegendItem(color: Colors.green, label: "Available"),
                LegendItem(color: Colors.red, label: "Occupied"),
                LegendItem(color: Colors.blueGrey, label: "Unavailable"),
              ],
            ),
          ),

          // Parking spots grid
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                int crossAxisCount = constraints.maxWidth < 400
                    ? 4
                    : constraints.maxWidth < 600
                    ? 5
                    : 6;

                return GridView.builder(
                  padding: EdgeInsets.all(screenWidth * 0.03),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    mainAxisSpacing: screenWidth * 0.02,
                    crossAxisSpacing: screenWidth * 0.02,
                    childAspectRatio: 1,
                  ),
                  itemCount: spots.length,
                  itemBuilder: (context, index) {
                    final spot = spots[index];
                    Color bgColor;
                    switch (spot["status"]) {
                      case "Occupied":
                        bgColor = Colors.red;
                        break;
                      case "Unavailable":
                        bgColor = Colors.blueGrey;
                        break;
                      default:
                        bgColor = Colors.green;
                    }

                    if (selectedSpot == spot["id"] &&
                        spot["status"] == "Available") {
                      bgColor = Colors.blue;
                    }

                    return GestureDetector(
                      onTap: () => setState(() => selectedSpot = spot["id"]),
                      child: Container(
                        decoration: BoxDecoration(
                          color: bgColor,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Center(
                          child: Text(
                            "${spot["id"]}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: screenWidth * 0.03,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),

          // Bottom details panel
          if (selectedSpot != null)
            SpotDetails(
              spot: spots.firstWhere((s) => s["id"] == selectedSpot),
              garageName: widget.garageName, // ← جديد
              date: widget.date, // ← جديد
              time: widget.time, // ← جديد
            ),
        ],
      ),
    );
  }
}
