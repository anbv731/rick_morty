import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:rick_morty/data/episode_model.dart';
import 'package:rick_morty/data/person_model.dart';
import 'package:rick_morty/screens/characters/bloc/screen_characters_event.dart';
import 'package:rick_morty/screens/characters/bloc/screen_characters_state.dart';
import 'dart:convert' as convert;



class ScreenEpisodesBloc
    extends Bloc<ScreenEpisodesEvent, ScreenEpisodesState> {
  ScreenEpisodesBloc() : super(InitialScreenEpisodesState());
  List<Episode> episodes = [];

  @override
  Stream<ScreenEpisodesState> mapEventToState(
      ScreenEpisodesEvent event,
      ) async* {
    if (event is InitialScreenEpisodesEvent){
      yield* _mapInitialScreenepisodesEvent();
    }
  }

  Stream<ScreenEpisodesState> _mapInitialScreenEpisodesEvent() async* {
    yield LoadingScreenEpisodesState();

    try { episodes=loadEpisode();

    } catch (ex) {
      print(ex);
      yield ErrorScreenCharactersState();
    }

    /// Возвращаем состояние с данными
    yield DataScreenCharactersState(
      charactersList: results,
      isList: isList,
    );
  }

  Stream<ScreenEpisodesState> _mapChangeViewScreenCharactersEvent(ChangeViewScreenCharactersEvent event) async* {
    yield LoadingScreenCharactersState();
    isList = !event.isList;
    yield DataScreenCharactersState(
      charactersList: results,
      isList: isList,
    );
  }
}





