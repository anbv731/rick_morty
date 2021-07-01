
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:rick_morty/components/characters_list/bloc/charactersList_event.dart';
import 'package:rick_morty/components/characters_list/bloc/charactersList_state.dart';
import 'package:rick_morty/components/service_api.dart';
import 'package:rick_morty/components/temporary_list_episodes.dart';
import 'package:rick_morty/data/person_model.dart';
import 'package:rick_morty/screens/characters/bloc/screen_characters_event.dart';
import 'package:rick_morty/screens/characters/bloc/screen_characters_state.dart';
import 'dart:convert' as convert;



class CharactersListBloc
    extends Bloc<CharactersListEvent, CharactersListState> {
  CharactersListBloc() : super(InitialCharactersListState());
  bool isList = true;
  List<Person> charactersList = [];


  @override
  Stream<CharactersListState> mapEventToState(
    CharactersListEvent event,
  ) async* {
    if (event is InitialCharactersListEvent){
      yield* _mapInitialCharactersListEvent();
    }
  }

  Stream<CharactersListState> _mapInitialCharactersListEvent() async* {
    yield LoadingCharactersListState();

    try {
      //ServiceApi.loadOnly(loadingCharactersList);
      charactersList = await ServiceApi().getCharacters();
    } catch (ex) {
      print(ex);
      yield ErrorCharactersListState();
    }

    /// Возвращаем состояние с данными
    yield DataCharactersListState(
      charactersList: charactersList,
    );
  }
}





