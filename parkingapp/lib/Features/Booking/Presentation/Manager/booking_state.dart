import 'package:parkingapp/Features/Booking/Data/Models/booking_model.dart';

import '../Data/Models/booking_model.dart';

abstract class BookingState {}

class BookingInitial extends BookingState {}

class BookingLoadingState extends BookingState {}


class BookingSuccessState extends BookingState {}


class PaymentMethodChangedState extends BookingState {
  final String selectedMethod;
  PaymentMethodChangedState(this.selectedMethod);
}


class BookingFetchSuccessState extends BookingState {
  final List<BookingModel> upcomingBookings;
  final List<BookingModel> historyBookings;

  BookingFetchSuccessState({
    required this.upcomingBookings,
    required this.historyBookings,
  });
}

class BookingErrorState extends BookingState {
  final String errorMessage;
  BookingErrorState(this.errorMessage);
}