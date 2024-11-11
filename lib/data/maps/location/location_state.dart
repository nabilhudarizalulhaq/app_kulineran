part of 'location_bloc.dart';

abstract class LocationState extends Equatable {
  const LocationState();

  @override
  List<Object?> get props => [];
}

class LocationInitial extends LocationState {}

class LocationLoaded extends LocationState {
  final LatLng? currentLocation;
  final LatLng? startLocation;
  final LatLng? goalLocation;

  LocationLoaded({this.currentLocation, this.startLocation, this.goalLocation});

  LocationLoaded copyWith({
    LatLng? currentLocation,
    LatLng? startLocation,
    LatLng? goalLocation,
  }) {
    return LocationLoaded(
      currentLocation: currentLocation ?? this.currentLocation,
      startLocation: startLocation ?? this.startLocation,
      goalLocation: goalLocation ?? this.goalLocation,
    );
  }

  @override
  List<Object?> get props => [currentLocation, startLocation, goalLocation];
}
