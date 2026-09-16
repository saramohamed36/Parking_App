import 'package:cloud_firestore/cloud_firestore.dart';

class Firebaseservices {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> saveBooking({
    required DateTime date,
    required String timeSlot,
    required String garageName,
  }) async {
    try {
      await _firestore.collection('bookings').add({
        'date': date.toIso8601String(),
        'timeSlot': timeSlot,
        'garageName': garageName,
        'createdAt': FieldValue.serverTimestamp(),
        'status': 'Upcoming',
      });
    } catch (e) {
      rethrow;
    }
  }
}
