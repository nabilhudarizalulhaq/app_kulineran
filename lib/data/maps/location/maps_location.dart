import 'package:apps_kulineran/data/maps/location/location_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsLocation extends StatefulWidget {
  const MapsLocation({super.key});

  @override
  _MapsLocationState createState() => _MapsLocationState();
}

class _MapsLocationState extends State<MapsLocation> {
  // ignore: unused_field
  late GoogleMapController _mapController;

  @override
  void initState() {
    super.initState();
    context.read<LocationBloc>().add(RequestCurrentLocation());
  }

  void _handleMapTap(LatLng tappedLatLng) {
    final state = context.read<LocationBloc>().state;
    if (state is LocationLoaded) {
      if (state.startLocation == null) {
        context.read<LocationBloc>().add(SetStartLocation(tappedLatLng));
      } else if (state.goalLocation == null) {
        context.read<LocationBloc>().add(SetGoalLocation(tappedLatLng));
      } else {
        context.read<LocationBloc>().add(ResetLocations());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Location')),
      body: Stack(
        children: [
          BlocBuilder<LocationBloc, LocationState>(
            builder: (context, state) {
              Set<Marker> markers = {};
              if (state is LocationLoaded) {
                if (state.currentLocation != null) {
                  markers.add(Marker(
                    markerId: MarkerId('currentLocation'),
                    position: state.currentLocation!,
                    infoWindow: InfoWindow(title: 'Current Location'),
                  ));
                }
                if (state.startLocation != null) {
                  markers.add(Marker(
                    markerId: MarkerId('start'),
                    position: state.startLocation!,
                    infoWindow: InfoWindow(title: 'Start'),
                    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
                  ));
                }
                if (state.goalLocation != null) {
                  markers.add(Marker(
                    markerId: MarkerId('goal'),
                    position: state.goalLocation!,
                    infoWindow: InfoWindow(title: 'Goal'),
                    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
                  ));
                }
              }

              return GoogleMap(
                onMapCreated: (controller) => _mapController = controller,
                initialCameraPosition: const CameraPosition(
                  target: LatLng(-7.0194, 113.8811),
                  zoom: 14,
                ),
                myLocationEnabled: true,
                myLocationButtonEnabled: true,
                markers: markers,
                onTap: _handleMapTap,
              );
            },
          ),
        ],
      ),
    );
  }
}
