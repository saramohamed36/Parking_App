// import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parkingapp/Features/MyBooking/Data/models/BookingModel.dart';

class BookingCardTile extends StatelessWidget {
  final BookingModel booking;
  final VoidCallback? onTap;

  const BookingCardTile({super.key, required this.booking, this.onTap});

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'confirmed':
      case 'completed':
        return const Color(0xFF4CAF50);
      case 'upcoming':
        return const Color(0xFF2196F3);
      case 'cancelled':
        return const Color(0xFFF44336);
      default:
        return const Color(0xFF9E9E9E);
    }
  }

  @override
  Widget build(BuildContext context) {
    final statusColor = _getStatusColor(booking.status);

    return Container(
     margin: EdgeInsets.only(bottom: 12.h),
      padding:  EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow:  [
          BoxShadow(color: Colors.black45, blurRadius: 6.r, offset: Offset(0, 2.h)),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 65,
            padding: EdgeInsets.symmetric(vertical: 12.h),
            decoration: BoxDecoration(
              color: const Color(0xFFF2F5FA),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  booking.dayName,
                  style:  TextStyle(
                    color: Color(0xFF1E3A8A),
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                 SizedBox(height: 2.h),
                Text(
                  booking.dayNumber,
                  style:  TextStyle(
                    color: Color(0xFF1E3A8A),
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                 SizedBox(height: 2.h),
                Text(
                  booking.month,
                  style:  TextStyle(color: Colors.grey, fontSize: 12.sp),
                ),
              ],
            ),
          ),
           SizedBox(width: 12.sp),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        booking.garageName,
                        style:  TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF0F172A),
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Container(
                      padding:  EdgeInsets.symmetric(
                      horizontal: 8.w,
                    vertical: 4.h,
                      ),
                      decoration: BoxDecoration(
                        color: statusColor.withOpacity(0.12),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Text(
                        booking.status,
                        style: TextStyle(
                          color: statusColor,
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),

                Row(
                  children: [
                    const Icon(
                      Icons.access_time,
                      size: 16,
                      color: Color(0xFF1E3A8A),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      booking.timeSlot,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF475569),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),

                Row(
                  children: [
                    const Icon(
                      Icons.directions_car_outlined,
                      size: 16,
                      color: Color(0xFF1E3A8A),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      booking.spotInfo,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF475569),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          IconButton(
            icon: const Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: Colors.grey,
            ),
            onPressed: onTap,
          ),
        ],
      ),
    );
  }
}
