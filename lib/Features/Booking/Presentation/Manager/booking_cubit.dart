import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parkingapp/Features/Booking/Data/Models/booking_model.dart';

import 'booking_state.dart';

class BookingCubit extends Cubit<BookingState> {
  BookingCubit() : super(BookingInitial());

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String selectedPaymentMethod = "Mastercard";

  void selectPaymentMethod(String method) {
    selectedPaymentMethod = method;
    emit(PaymentMethodChangedState(selectedPaymentMethod));
  }

  Future<void> confirmAndPay(BookingModel newBooking) async {
    emit(BookingLoadingState());

    try {
      await _firestore.collection('bookings').add(newBooking.toMap());
      emit(BookingSuccessState());
    } catch (e) {
      emit(BookingErrorState("Failed to confirm booking: ${e.toString()}"));
    }
  }

  Future<void> fetchMyBookings() async {
    emit(BookingLoadingState());

    try {
      final snapshot = await _firestore.collection('bookings').get();

      final List<BookingModel> loadedBookings = snapshot.docs.map((doc) {
        return BookingModel.fromMap(doc.data(), doc.id);
      }).toList();

      final upcoming = loadedBookings.where((b) => b.isUpcoming).toList();
      final history = loadedBookings.where((b) => !b.isUpcoming).toList();

      emit(
        BookingFetchSuccessState(
          upcomingBookings: upcoming,
          historyBookings: history,
        ),
      );
    } catch (e) {
      emit(BookingErrorState("Failed to load bookings: ${e.toString()}"));
    }
  }
}
