import 'package:equatable/equatable.dart';
import 'package:rick_morty/data/episode_model.dart';
import 'package:rick_morty/data/person_model.dart';

abstract class ScreenCharacterEpisodesState extends Equatable {
  const ScreenCharacterEpisodesState();

  @override
  List<Object> get props => [];
}

class InitialScreenCharacterEpisodesState extends ScreenCharacterEpisodesState {
  InitialScreenCharacterEpisodesState();

  @override
  List<Object> get props => [];
}

class ErrorScreenCharacterEpisodesState extends ScreenCharacterEpisodesState {
  ErrorScreenCharacterEpisodesState();

  @override
  List<Object> get props => [];
}

class LoadingScreenCharacterEpisodesState extends ScreenCharacterEpisodesState {
  LoadingScreenCharacterEpisodesState();

  @override
  List<Object> get props => [];
}

class DataScreenCharacterEpisodesState extends ScreenCharacterEpisodesState {
  final List<Episode> episodesList;

  DataScreenCharacterEpisodesState({this.episodesList});

  @override
  List<Object> get props => [episodesList];
}
