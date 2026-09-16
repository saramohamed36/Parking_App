import '../../Data/Models/GarageModel.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<GarageModel> garages;

  HomeLoaded(this.garages);
}

class HomeError extends HomeState {
  final String message;

  HomeError(this.message);
}
