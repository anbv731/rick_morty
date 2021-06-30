
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:rick_morty/components/episodes_list/bloc/screen_character_episodes_event.dart';
import 'package:rick_morty/components/episodes_list/bloc/screen_character_episodes_state.dart';
import 'package:rick_morty/components/service_api.dart';
import 'package:rick_morty/components/temporary_list_episodes.dart';
import 'package:rick_morty/data/episode_model.dart';
import 'package:rick_morty/data/person_model.dart';
import 'package:rick_morty/screens/episodes/bloc/screen_episodes_event.dart';
import 'dart:convert' as convert;
import 'package:rick_morty/screens/episodes/bloc/screen_episodes_state.dart';

class ScreenCharacterEpisodesBloc
    extends Bloc<ScreenCharacterEpisodesEvent, ScreenCharacterEpisodesState> {

  ScreenCharacterEpisodesBloc() : super(InitialScreenCharacterEpisodesState());

  @override
  Stream<ScreenCharacterEpisodesState> mapEventToState(
      ScreenCharacterEpisodesEvent event,
      ) async* {
    if (event is LoadingScreenCharacterEpisodesEvent){
      yield* _mapLoadingScreenCharacterEpisodesEvent();
    }
  }

  Stream<ScreenCharacterEpisodesState> _mapLoadingScreenCharacterEpisodesEvent() async* {
    yield LoadingScreenCharacterEpisodesState();
    List<Episode> episodes = [];
    try {
      episodes= await ServiceApi().getEpisodes();
    }
    catch (ex) {
      print(ex);
      yield ErrorScreenCharacterEpisodesState();
    }

    TempLists.tempListEp = episodes;
    /// Возвращаем состояние с данными
    yield DataScreenCharacterEpisodesState(
      episodesList: episodes,

    );
  }
}





