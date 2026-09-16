import 'package:parkingapp/Features/MyBooking/Data/models/BookingModel.dart';

abstract class MyBookingState {}

class MyBookingInitial extends MyBookingState {}

class MyBookingLoading extends MyBookingState {}

class MyBookingLoaded extends MyBookingState {
  final List<BookingModel> upcomingBookings;
  final List<BookingModel> historyBookings;

  MyBookingLoaded({
    required this.upcomingBookings,
    required this.historyBookings,
  });
}

class MyBookingEmpty extends MyBookingState {}

class MyBookingErrorState extends MyBookingState {
  final String errorMessage;
  MyBookingErrorState(this.errorMessage);
}
