import 'package:equatable/equatable.dart';
import 'package:rick_morty/data/episode_model.dart';
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

class ErrorScreenEpisodesState extends ScreenEpisodesState {
  ErrorScreenEpisodesState();

  @override
  List<Object> get props => [];
}

class LoadingScreenEpisodesState extends ScreenEpisodesState {
  LoadingScreenEpisodesState();

  @override
  List<Object> get props => [];
}

class DataScreenEpisodesState extends ScreenEpisodesState {
  final List<Episode> episodesList;

  DataScreenEpisodesState({this.episodesList});

  @override
  List<Object> get props => [episodesList];
}
