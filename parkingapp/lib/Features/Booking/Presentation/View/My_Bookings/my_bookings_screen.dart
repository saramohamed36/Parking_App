import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Manager/booking_cubit.dart';
import 'my_bookings_upcoming_view.dart';
import 'my_bookings_history_view.dart';

class MyBookingsScreen extends StatelessWidget {
  static const String routeName = '/myBookings';

  const MyBookingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BookingCubit()..fetchMyBookings(),
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: const Text(
              "My Bookings",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
            bottom: const TabBar(
              labelColor: Colors.blue,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Colors.blue,
              tabs: [
                Tab(text: "Upcoming"),
                Tab(text: "History"),
              ],
            ),
          ),
          body: TabBarView(
            children: [MyBookingsUpcomingView(), MyBookingHistoryView()],
          ),
        ),
      ),
    );
  }
}
