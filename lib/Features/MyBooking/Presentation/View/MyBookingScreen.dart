import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parkingapp/Core/Shared_Widgets/BottomNav.dart';
import 'package:parkingapp/Features/MyBooking/Widgets/HistoryBookingsBody.dart';
import 'package:parkingapp/Features/MyBooking/Widgets/UpcomingBookingsBody.dart';

import '../Manager/MyBookingCubit.dart';
import '../Manager/MyBookingState.dart';

class MyBookingScreen extends StatelessWidget {
  const MyBookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MyBookingCubit()..fetchBookings(),
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: const Color(0xFFF7F8FA),
          appBar: AppBar(
            title: Text(
              'My Bookings',
              style: TextStyle(
                fontSize: 18.sp, // responsive font size
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            centerTitle: true,
            bottom: TabBar(
              labelColor: Colors.blue,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Colors.blue,
              labelStyle: TextStyle(
                fontSize: 14.sp, // responsive tab text
                fontWeight: FontWeight.w600,
              ),
              tabs: const [
                Tab(text: 'Upcoming'),
                Tab(text: 'History'),
              ],
            ),
          ),
          body: BlocBuilder<MyBookingCubit, MyBookingState>(
            builder: (context, state) {
              if (state is MyBookingLoaded) {
                return TabBarView(
                  children: [
                    UpcomingBookingsBody(upcomingBookings: state.upcomingBookings),
                    HistoryBookingsBody(historyBookings: state.historyBookings),
                  ],
                );
              } else if (state is MyBookingErrorState) {
                return Center(
                  child: Text(
                    state.errorMessage,
                    style: TextStyle(color: Colors.red, fontSize: 14.sp),
                  ),
                );
              } else if (state is MyBookingEmpty) {
                return Center(
                  child: Text(
                    "No bookings found",
                    style: TextStyle(fontSize: 14.sp),
                  ),
                );
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
          bottomNavigationBar: const BottomNav(currentIndex: 2),
        ),
      ),
    );
  }
}
