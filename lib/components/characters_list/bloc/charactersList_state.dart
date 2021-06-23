
import 'package:equatable/equatable.dart';
import 'package:rick_morty/data/person_model.dart';

abstract class CharactersListState extends Equatable {
  const CharactersListState();

  @override
  List<Object> get props => [];
}

class InitialCharactersListState extends CharactersListState {
  InitialCharactersListState();

  @override
  List<Object> get props => [];
}

class ErrorCharactersListState extends CharactersListState {
  ErrorCharactersListState();

  @override
  List<Object> get props => [];
}

class LoadingCharactersListState extends CharactersListState {
  LoadingCharactersListState();

  @override
  List<Object> get props => [];
}

class DataCharactersListState extends CharactersListState {
  final List<Person> charactersList;

  DataCharactersListState({this.charactersList});

  @override
  List<Object> get props => [charactersList];
}
