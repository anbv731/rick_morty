
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:rick_morty/data/episode_model.dart';
import 'package:rick_morty/screens/episodes/bloc/screen_episodes_event.dart';
import 'dart:convert' as convert;
import 'package:rick_morty/screens/episodes/bloc/screen_episodes_state.dart';

class ScreenEpisodesBloc
    extends Bloc<ScreenEpisodesEvent, ScreenEpisodesState> {
  ScreenEpisodesBloc() : super(InitialScreenEpisodesState());


  @override
  Stream<ScreenEpisodesState> mapEventToState(
      ScreenEpisodesEvent event,
      ) async* {
    if (event is LoadingScreenEpisodesEvent){
      yield* _mapLoadingScreenEpisodesEvent();
    }
  }

  Stream<ScreenEpisodesState> _mapLoadingScreenEpisodesEvent() async* {
    yield LoadingScreenEpisodesState();
    List<Episode> episodes = [];
    try {
      http.Response response = await http.get(
        Uri.parse('https://rickandmortyapi.com/api/episode'),
      );
      if (response.statusCode == 200) {
        List<dynamic> episodesList = convert.jsonDecode(
            response.body)['results'];
        for (var result in episodesList) {
          Episode episode = Episode();
          episode.id = result['id'];
          episode.name = result['name'];
          episode.airDate = result['air_date'];
          episode.url = result['url'];
          episode.episode = result['episode'];
          episode.characters = List<String>.from(result['characters']);
          episode.created = result ['created'];
          episodes.add(episode);
        }
      }
    }
    catch (ex) {
      print(ex);
      yield ErrorScreenEpisodesState();
    }

    /// Возвращаем состояние с данными
    yield DataScreenEpisodesState(
      episodesList: episodes,

    );
  }
}





