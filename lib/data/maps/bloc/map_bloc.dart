// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  MapBloc() : super(MapInitial()) {
    on<LoadMap>(_onLoadMap);
  }

  void _onLoadMap(LoadMap event, Emitter<MapState> emit) {
    // Default location for demonstration (e.g., Jakarta, Indonesia)
    const initialPosition = CameraPosition(
      target: LatLng(-6.2088, 106.8456),
      zoom: 14,
    );
    emit(MapLoaded(initialPosition));
  }
}
