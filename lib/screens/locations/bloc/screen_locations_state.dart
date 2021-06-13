import 'package:equatable/equatable.dart';
import 'package:rick_morty/data/location_model.dart';

abstract class ScreenLocationsState extends Equatable {
  const ScreenLocationsState();

  @override
  List<Object> get props => [];
}

class InitialScreenLocationsState extends ScreenLocationsState {
  InitialScreenLocationsState();

  @override
  List<Object> get props => [];
}

class ErrorScreenLocationsState extends ScreenLocationsState {
  ErrorScreenLocationsState();

  @override
  List<Object> get props => [];
}

class LoadingScreenLocationsState extends ScreenLocationsState {
  LoadingScreenLocationsState();

  @override
  List<Object> get props => [];
}

class DataScreenLocationsState extends ScreenLocationsState {
  final List<Location> locationsList;

  DataScreenLocationsState({this.locationsList});

  @override
  List<Object> get props => [locationsList];
}
