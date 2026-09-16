import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parkingapp/Core/Shared_Widgets/BottomNav.dart';
import 'package:parkingapp/Features/MyBooking/Widgets/HistoryBookingsBody.dart';
import 'package:parkingapp/Features/MyBooking/Widgets/UpcomingBookingsBody.dart';

import '../Manager/MyBookingCubit.dart';
import '../Manager/MyBookingState.dart';

class MyBookingScreen extends StatefulWidget {
  const MyBookingScreen({super.key});

  @override
  State<MyBookingScreen> createState() => _MyBookingScreenState();
}

class _MyBookingScreenState extends State<MyBookingScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 1; 

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    context.read<MyBookingCubit>().fetchBookings();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),
      appBar: AppBar(
        title: const Text('My Bookings'),
        bottom: TabBar(
          controller: _tabController,
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
              controller: _tabController,
              children: [
                UpcomingBookingsBody(upcomingBookings: state.upcomingBookings),
                HistoryBookingsBody(historyBookings: state.historyBookings),
              ],
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
      bottomNavigationBar: const BottomNav(currentIndex: 2),
    );
  }
}
