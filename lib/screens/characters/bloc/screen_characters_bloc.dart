import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:rick_morty/components/service_api.dart';
import 'package:rick_morty/components/temporary_list_episodes.dart';
import 'package:rick_morty/data/person_model.dart';
import 'package:rick_morty/screens/characters/bloc/screen_characters_event.dart';
import 'package:rick_morty/screens/characters/bloc/screen_characters_state.dart';
import 'dart:convert' as convert;

class ScreenCharactersBloc
    extends Bloc<ScreenCharactersEvent, ScreenCharactersState> {
  ScreenCharactersBloc() : super(InitialScreenCharactersState());
  bool isList = true;
  List<Person> results = [];
  String request;

  @override
  Stream<ScreenCharactersState> mapEventToState(
    ScreenCharactersEvent event,
  ) async* {
    if (event is InitialScreenCharactersEvent) {
      yield* _mapInitialScreenCharactersEvent();
    }
    if (event is SearchScreenCharactersEvent) {
      yield* _mapSearchScreenCharactersEvent(event);
    }
    if (event is ChangeViewScreenCharactersEvent) {
      yield* _mapChangeViewScreenCharactersEvent(event);
    }
  }

  Stream<ScreenCharactersState> _mapInitialScreenCharactersEvent() async* {
    yield LoadingScreenCharactersState();

    try {
      results = await ServiceApi().getCharacters();
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

  Stream<ScreenCharactersState> _mapSearchScreenCharactersEvent(
      SearchScreenCharactersEvent event) async* {
    yield LoadingScreenCharactersState();
    request = event.request;
    try {
      results = await ServiceApi().getSearchCharacters(request);
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

  Stream<ScreenCharactersState> _mapChangeViewScreenCharactersEvent(
      ChangeViewScreenCharactersEvent event) async* {
    yield LoadingScreenCharactersState();
    isList = !event.isList;
    yield DataScreenCharactersState(
      charactersList: results,
      isList: isList,
    );
  }
}
