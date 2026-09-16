import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parkingapp/Core/fireBaseServices.dart';

part 'booking_form_state.dart';

class BookingFormCubit extends Cubit<BookingFormState> {
  BookingFormCubit() : super(BookingFormState.initial());

  void selectDate(DateTime date) {
    emit(state.copyWith(selectedDate: date));
  }

  void selectTime(String timeSlot) {
    emit(state.copyWith(selectedTimeSlot: timeSlot));
  }

  void selectGarage(String garageName) {
    emit(state.copyWith(selectedGarage: garageName));
  }

  String formattedDate() {
    const weekdays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    final date = state.selectedDate;
    final weekday = weekdays[date.weekday - 1];
    final month = months[date.month - 1];
    return '$weekday, ${date.day} $month ${date.year}';
  }

  Future<void> saveBooking() async {
    await Firebaseservices().saveBooking(
      date: state.selectedDate,
      timeSlot: state.selectedTimeSlot,
      garageName: state.selectedGarage,
    );
  }
}
