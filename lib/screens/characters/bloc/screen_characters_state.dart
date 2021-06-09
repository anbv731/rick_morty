import 'package:equatable/equatable.dart';
import 'package:rick_morty/data/person_model.dart';

abstract class ScreenEpisodesState extends Equatable {
  const ScreenEpisodesState();

  @override
  List<Object> get props => [];
}

class InitialScreenEpisodesState extends ScreenEpisodesState {
  InitialScreenEpisodesState();

  @override
  List<Object> get props => [];
}

class ErrorScreenCharactersState extends ScreenEpisodesState {
  ErrorScreenCharactersState();

  @override
  List<Object> get props => [];
}

class LoadingScreenCharactersState extends ScreenEpisodesState {
  LoadingScreenCharactersState();

  @override
  List<Object> get props => [];
}

class DataScreenCharactersState extends ScreenEpisodesState {
  final bool isList;
  final List<Person> charactersList;

  DataScreenCharactersState({this.charactersList, this.isList});

  @override
  List<Object> get props => [charactersList, isList];
}
