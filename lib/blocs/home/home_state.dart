part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<WisatakulinerModel> kuliners;
  const HomeLoaded(this.kuliners);
}

class HomeError extends HomeState {
  final String error;
  const HomeError(this.error);
}