class BookingModel {
  final String? id;
  final String garageName;
  final String date;
  final String time;
  final String spot;
  final String totalPrice;
  final bool isUpcoming;

  const BookingModel({
    this.id,
    required this.garageName,
    required this.date,
    required this.time,
    required this.spot,
    required this.totalPrice,
    this.isUpcoming = true,
  });

  Map<String, dynamic> toMap() {
    return {
      'garageName': garageName,
      'date': date,
      'time': time,
      'spot': spot,
      'totalPrice': totalPrice,
      'isUpcoming': isUpcoming,
      'createdAt': DateTime.now(),
    };
  }

  factory BookingModel.fromMap(Map<String, dynamic> map, String docId) {
    return BookingModel(
      id: docId,
      garageName: map['garageName'] ?? '',
      date: map['date'] ?? '',
      time: map['time'] ?? '',
      spot: map['spot'] ?? '',
      totalPrice: map['totalPrice'] ?? '',
      isUpcoming: map['isUpcoming'] ?? true,
    );
  }
}
