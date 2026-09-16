import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:parkingapp/Features/MyBooking/Data/models/BookingModel.dart';
import 'package:parkingapp/Features/MyBooking/Presentation/Manager/MyBookingState.dart';

class MyBookingCubit extends Cubit<MyBookingState> {
  MyBookingCubit() : super(MyBookingInitial());

  // 1. تعريف الـ Hive Box
  final Box _bookingsBox = Hive.box("UserBookings");

  void fetchBookings() {
    // 2. قراءة البيانات المكتوبة في Hive وتحويلها لـ List of BookingModel
    List rawData = _bookingsBox.get('bookings_list', defaultValue: []);

    List<BookingModel> allBookings = rawData.map((item) {
      Map<String, dynamic> map = Map<String, dynamic>.from(item);
      return BookingModel(
        dayName: map['dayName'] ?? '',
        dayNumber: map['dayNumber'] ?? '',
        month: map['month'] ?? '',
        garageName: map['garageName'] ?? '',
        timeSlot: map['timeSlot'] ?? '',
        spotInfo: map['spotInfo'] ?? '',
        status: map['status'] ?? 'Upcoming',
      );
    }).toList();

    // فصل الـ Upcoming عن الـ History
    List<BookingModel> upcoming = allBookings
        .where((b) => b.status == 'Upcoming')
        .toList();
    List<BookingModel> history = allBookings
        .where((b) => b.status != 'Upcoming')
        .toList();

    emit(MyBookingLoaded(upcomingBookings: upcoming, historyBookings: history));
  }

  void addBooking(BookingModel booking) {
    List rawData = _bookingsBox.get('bookings_list', defaultValue: []);

    // تحويل الـ Model لـ Map وحفظه في Hive
    Map<String, dynamic> newBookingMap = {
      'dayName': booking.dayName,
      'dayNumber': booking.dayNumber,
      'month': booking.month,
      'garageName': booking.garageName,
      'timeSlot': booking.timeSlot,
      'spotInfo': booking.spotInfo,
      'status': booking.status,
    };

    rawData.insert(0, newBookingMap);
    _bookingsBox.put('bookings_list', rawData);

    fetchBookings();
  }

  void moveBookingToHistory(BookingModel booking, {bool isCancelled = false}) {
    List rawData = _bookingsBox.get('bookings_list', defaultValue: []);

    for (var item in rawData) {
      if (item['garageName'] == booking.garageName &&
          item['timeSlot'] == booking.timeSlot) {
        item['status'] = isCancelled ? 'Cancelled' : 'Completed';
        break;
      }
    }

    _bookingsBox.put('bookings_list', rawData);
    fetchBookings();
  }
}
