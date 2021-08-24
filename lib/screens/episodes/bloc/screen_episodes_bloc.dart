import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:rick_morty/components/service_api.dart';
import 'package:rick_morty/components/temporary_list_episodes.dart';
import 'package:rick_morty/data/episode_model.dart';
import 'package:rick_morty/screens/episodes/bloc/screen_episodes_event.dart';
import 'dart:convert' as convert;
import 'package:rick_morty/screens/episodes/bloc/screen_episodes_state.dart';

class ScreenEpisodesBloc
    extends Bloc<ScreenEpisodesEvent, ScreenEpisodesState> {
  ScreenEpisodesBloc() : super(InitialScreenEpisodesState());
  List<Episode> episodes = [];
  String request;

  @override
  Stream<ScreenEpisodesState> mapEventToState(
    ScreenEpisodesEvent event,
  ) async* {
    if (event is InitialScreenEpisodesEvent) {
      yield* _mapInitialScreenEpisodesEvent();
    }
    if (event is SearchScreenEpisodesEvent) {
      yield* _mapSearchScreenEpisodesEvent(event);
    }
  }

  Stream<ScreenEpisodesState> _mapInitialScreenEpisodesEvent() async* {
    yield LoadingScreenEpisodesState();
    List<Episode> episodes = [];
    try {
      episodes = await ServiceApi().getEpisodes();
    } catch (ex) {
      print(ex);
      yield ErrorScreenEpisodesState();
    }

    /// Возвращаем состояние с данными
    yield DataScreenEpisodesState(
      episodesList: episodes,
    );
  }

  Stream<ScreenEpisodesState> _mapSearchScreenEpisodesEvent(
      SearchScreenEpisodesEvent event) async* {
    yield LoadingScreenEpisodesState();
    List<Episode> episodes = [];
    request = event.request;
    try {
      episodes = await ServiceApi().getSearchEpisodes(request);
    } catch (ex) {
      print(ex);
      yield ErrorScreenEpisodesState();
    }

    /// Возвращаем состояние с данными
    yield DataScreenEpisodesState(
      episodesList: episodes,
    );
  }
}
