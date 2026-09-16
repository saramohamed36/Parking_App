import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:parkingapp/Core/Routing/Routes.dart';
import 'package:parkingapp/Features/Booking/Data/Models/booking_model.dart';

class SpotDetails extends StatelessWidget {
  final Map<String, dynamic> spot;
  final String garageName;
  final String date;
  final String time;

  const SpotDetails({
    super.key,
    required this.spot,
    required this.garageName,
    required this.date,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    final status = spot["status"];
    final statusColor = (status == "Occupied")
        ? Colors.red
        : (status == "Unavailable")
        ? Colors.blueGrey
        : Colors.green;

    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.all(screenWidth * 0.04),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:  BorderRadius.vertical(top: Radius.circular(16.r)),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6.r,
            offset:  Offset(0, -2.h),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                Icons.directions_car,
                size: screenWidth * 0.08,
                color: statusColor,
              ),
              SizedBox(width: screenWidth * 0.03),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Spot ${spot["id"]}",
                    style: TextStyle(
                      fontSize: screenWidth * 0.045,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  Text(
                    "${spot["level"]} • ${spot["row"]}",
                    style: TextStyle(
                      fontSize: screenWidth * 0.035,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.03,
                  vertical: screenWidth * 0.015,
                ),
                decoration: BoxDecoration(
                  color: statusColor,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Text(
                  status,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: screenWidth * 0.03),
          if (status == "Available")
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: EdgeInsets.symmetric(vertical: screenWidth * 0.04),
                ),
                onPressed: () {
                  context.push(
                    Routes.paymentScreen,
                    extra: BookingModel(
                      garageName: garageName,
                      date: date,
                      time: time,
                      spot: "${spot["id"]}",
                      totalPrice: "15.00",
                    ),
                  );
                },
                child: Text(
                  "Book Spot",
                  style: TextStyle(
                    fontSize: screenWidth * 0.04,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
