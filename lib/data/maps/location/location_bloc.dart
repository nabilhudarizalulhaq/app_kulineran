import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  final Location _location = Location();

  LocationBloc() : super(LocationInitial()) {
    on<RequestCurrentLocation>(_onRequestCurrentLocation);
    on<SetStartLocation>(_onSetStartLocation);
    on<SetGoalLocation>(_onSetGoalLocation);
    on<ResetLocations>(_onResetLocations);
  }

  Future<void> _onRequestCurrentLocation(
      RequestCurrentLocation event, Emitter<LocationState> emit) async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;

    serviceEnabled = await _location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await _location.requestService();
      if (!serviceEnabled) return;
    }

    permissionGranted = await _location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await _location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) return;
    }

    final locationData = await _location.getLocation();
    final currentLatLng = LatLng(locationData.latitude!, locationData.longitude!);
    
    emit(LocationLoaded(currentLocation: currentLatLng));
  }

  void _onSetStartLocation(SetStartLocation event, Emitter<LocationState> emit) {
    if (state is LocationLoaded) {
      emit((state as LocationLoaded).copyWith(startLocation: event.location));
    }
  }

  void _onSetGoalLocation(SetGoalLocation event, Emitter<LocationState> emit) {
    if (state is LocationLoaded) {
      emit((state as LocationLoaded).copyWith(goalLocation: event.location));
    }
  }

  void _onResetLocations(ResetLocations event, Emitter<LocationState> emit) {
    if (state is LocationLoaded) {
      emit((state as LocationLoaded).copyWith(startLocation: null, goalLocation: null));
    }
  }
}
