import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Manager/booking_cubit.dart';
import '../../Manager/booking_state.dart';
import '../../widgets/bookings_upcoming_item.dart';

class MyBookingsUpcomingView extends StatelessWidget {
  const MyBookingsUpcomingView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookingCubit, BookingState>(
      builder: (context, state) {
        if (state is BookingLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is BookingFetchSuccessState) {
          if (state.upcomingBookings.isEmpty) {
            return const Center(child: Text("No upcoming bookings found."));
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: state.upcomingBookings.length,
            itemBuilder: (context, index) {
              return BookingsUpcomingItem(
                booking: state.upcomingBookings[index],
              );
            },
          );
        } else if (state is BookingErrorState) {
          return Center(child: Text(state.errorMessage));
        }

        return const SizedBox.shrink();
      },
    );
  }
}
