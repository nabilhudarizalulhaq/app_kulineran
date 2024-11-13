import 'package:apps_kulineran/data/datasource/remote_data_source.dart';
import 'package:apps_kulineran/data/models/wisata_kuliner_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final RemoteDataSource remoteDataSource;
  HomeBloc({required this.remoteDataSource}) : super(HomeInitial()){
    on<LoadHome>((event, emit) async {
      emit(HomeLoading());
      try {
        final result = await remoteDataSource.getKuliner();
        emit(HomeLoaded(result.data));
      } catch (error) {
        emit(HomeError(error.toString()));
      }
    });
  }
}
