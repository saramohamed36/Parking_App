part of 'booking_form_cubit.dart';

class BookingFormState {
  final DateTime selectedDate;
  final String selectedTimeSlot;
  final String selectedGarage;

  const BookingFormState({
    required this.selectedDate,
    required this.selectedTimeSlot,
    required this.selectedGarage,
  });

  factory BookingFormState.initial() {
    return BookingFormState(
      selectedDate: DateTime.now(),
      selectedTimeSlot: 'Morning (6 AM - 12 PM)',
      selectedGarage: 'Downtown Mall Garage',
    );
  }

  BookingFormState copyWith({
    DateTime? selectedDate,
    String? selectedTimeSlot,
    String? selectedGarage,
  }) {
    return BookingFormState(
      selectedDate: selectedDate ?? this.selectedDate,
      selectedTimeSlot: selectedTimeSlot ?? this.selectedTimeSlot,
      selectedGarage: selectedGarage ?? this.selectedGarage,
    );
  }
}
