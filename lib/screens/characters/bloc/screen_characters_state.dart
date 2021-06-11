import 'package:equatable/equatable.dart';
import 'package:rick_morty/data/person_model.dart';

abstract class ScreenCharactersState extends Equatable {
  const ScreenCharactersState();

  @override
  List<Object> get props => [];
}

class InitialScreenCharactersState extends ScreenCharactersState {
  InitialScreenCharactersState();

  @override
  List<Object> get props => [];
}

class ErrorScreenCharactersState extends ScreenCharactersState {
  ErrorScreenCharactersState();

  @override
  List<Object> get props => [];
}

class LoadingScreenCharactersState extends ScreenCharactersState {
  LoadingScreenCharactersState();

  @override
  List<Object> get props => [];
}

class DataScreenCharactersState extends ScreenCharactersState {
  final bool isList;
  final List<Person> charactersList;

  DataScreenCharactersState({this.charactersList, this.isList});

  @override
  List<Object> get props => [charactersList, isList];
}
