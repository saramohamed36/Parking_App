import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Data/Repositories/GarageRepository.dart';
import 'HomeState.dart';

class HomeCubit extends Cubit<HomeState> {
  final GarageRepository repository;

  HomeCubit(this.repository) : super(HomeInitial());

  Future<void> fetchGarages() async {
    emit(HomeLoading());

    try {
      final garages = await repository.getNearbyGarages();

      emit(HomeLoaded(garages));
    } catch (e) {
      emit(HomeError('Failed to load data'));
    }
  }
}
