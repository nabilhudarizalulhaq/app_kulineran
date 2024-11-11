part of 'location_bloc.dart';

abstract class LocationEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class RequestCurrentLocation extends LocationEvent {}

class SetStartLocation extends LocationEvent {
  final LatLng location;

  SetStartLocation(this.location);

  @override
  List<Object?> get props => [location];
}

class SetGoalLocation extends LocationEvent {
  final LatLng location;

  SetGoalLocation(this.location);

  @override
  List<Object?> get props => [location];
}

class ResetLocations extends LocationEvent {}
