part of 'map_bloc.dart';

abstract class MapState extends Equatable {
  const MapState();
  
  @override
  List<Object> get props => [];
}

class MapInitial extends MapState {}

class MapLoaded extends MapState {
  final CameraPosition initialPosition;

  const MapLoaded(this.initialPosition);

  @override
  List<Object> get props => [initialPosition];
}