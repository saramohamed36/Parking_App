import 'package:flutter_bloc/flutter_bloc.dart';

class ParkingSpotState {
  final List<Map<String, dynamic>> spots;
  final int? selectedSpot;

  ParkingSpotState({required this.spots, this.selectedSpot});

  ParkingSpotState copyWith({
    List<Map<String, dynamic>>? spots,
    int? selectedSpot,
  }) {
    return ParkingSpotState(
      spots: spots ?? this.spots,
      selectedSpot: selectedSpot ?? this.selectedSpot,
    );
  }
}

class ParkingSpotCubit extends Cubit<ParkingSpotState> {
  ParkingSpotCubit() : super(ParkingSpotState(spots: [], selectedSpot: null)) {
    initSpots();
  }

  void initSpots() {
    final generatedSpots = List.generate(20, (index) {
      int spotNumber = 101 + index;
      return {
        "id": spotNumber,
        "status":
            (spotNumber == 103 ||
                spotNumber == 108 ||
                spotNumber == 113 ||
                spotNumber == 114)
            ? "Occupied"
            : (spotNumber == 117 || spotNumber == 120)
            ? "Unavailable"
            : "Available",
        "level": "Level 1",
        "row": "Row B",
      };
    });

    emit(state.copyWith(spots: generatedSpots));
  }

  void selectSpot(int id) {
    emit(state.copyWith(selectedSpot: id));
  }
}
