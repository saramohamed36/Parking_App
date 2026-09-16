import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parkingapp/Features/Home/Widgets/legend_item.dart';
import 'package:parkingapp/Features/Home/Widgets/spot_details.dart';
import '../Manager/spot_cubit.dart';

class ParkingSpotScreen extends StatelessWidget {
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

  static Widget withCubit({
    required String garageName,
    required String garageDistance,
    required String date,
    required String time,
  }) {
    return BlocProvider(
      create: (_) => ParkingSpotCubit(),
      child: ParkingSpotScreen(
        garageName: garageName,
        garageDistance: garageDistance,
        date: date,
        time: time,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black, size: 20.sp),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Parking Spots",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
      ),
      body: BlocBuilder<ParkingSpotCubit, ParkingSpotState>(
        builder: (context, state) {
          final cubit = context.read<ParkingSpotCubit>();

          return Column(
            children: [
              // Garage info card
              Container(
                margin: EdgeInsets.all(16.w),
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.r),
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
                    Icon(Icons.directions_car,
                        size: 40.sp, color: Colors.green),
                    SizedBox(width: 12.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          garageName,
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "Level 1",
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Text(
                      garageDistance,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),

              // Legend row
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
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
                      padding: EdgeInsets.all(12.w),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: crossAxisCount,
                        mainAxisSpacing: 8.h,
                        crossAxisSpacing: 8.w,
                        childAspectRatio: 1,
                      ),
                      itemCount: state.spots.length,
                      itemBuilder: (context, index) {
                        final spot = state.spots[index];
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

                        if (state.selectedSpot == spot["id"] &&
                            spot["status"] == "Available") {
                          bgColor = Colors.blue;
                        }

                        return GestureDetector(
                          onTap: () => cubit.selectSpot(spot["id"]),
                          child: Container(
                            decoration: BoxDecoration(
                              color: bgColor,
                              borderRadius: BorderRadius.circular(6.r),
                            ),
                            child: Center(
                              child: Text(
                                "${spot["id"]}",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 14.sp,
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
              if (state.selectedSpot != null)
                SpotDetails(
                  spot: state.spots
                      .firstWhere((s) => s["id"] == state.selectedSpot),
                  garageName: garageName,
                  date: date,
                  time: time,
                ),
            ],
          );
        },
      ),
    );
  }
}
