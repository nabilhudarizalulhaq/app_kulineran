import 'package:apps_kulineran/data/maps/bloc/map_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsPage extends StatelessWidget {
  const MapsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MapBloc()..add(LoadMap()),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Map Page"),
        ),
        body: BlocBuilder<MapBloc, MapState>(
          builder: (context, state) {
            if (state is MapInitial) {
              return Center(child: CircularProgressIndicator());
            } else if (state is MapLoaded) {
              return GoogleMap(
                initialCameraPosition: state.initialPosition,
                myLocationEnabled: true,
                myLocationButtonEnabled: true,
              );
            } else {
              return Center(child: Text("Failed to load map"));
            }
          },
        ),
      ),
    );
  }
}
