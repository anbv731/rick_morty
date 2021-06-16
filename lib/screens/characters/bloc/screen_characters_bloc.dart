import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
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

  @override
  Stream<ScreenCharactersState> mapEventToState(
    ScreenCharactersEvent event,
  ) async* {
    if (event is InitialScreenCharactersEvent){
      yield* _mapInitialScreenCharactersEvent();
    }
    if (event is ChangeViewScreenCharactersEvent){
      yield* _mapChangeViewScreenCharactersEvent(event);
    }
  }

  Stream<ScreenCharactersState> _mapInitialScreenCharactersEvent() async* {
    yield LoadingScreenCharactersState();

    try { for (int i=1;i < 35;i++){
      http.Response response = await http.get(
        Uri.parse('https://rickandmortyapi.com/api/character/?page=$i'),
      );

      if (response.statusCode == 200) {
        List<dynamic> resultsList =
            convert.jsonDecode(response.body)['results'];
        for (var result in resultsList) {
          Person person = Person();
          person.id = result['id'];
          person.name = result['name'];
          person.status = result['status'];
          person.url = result['url'];
          person.image = result['image'];
          person.species = result['species'];
          person.gender = result['gender'];
          person.origin = result['origin'] != null
              ? Origin.fromJson(result['origin'])
              : null;
          person.location = result['location'] != null
              ? Origin.fromJson(result['location'])
              : null;
          results.add(person);}
        }
      }
    } catch (ex) {
      print(ex);
      yield ErrorScreenCharactersState();
    }
    TempLists.tempListPer = results;

    /// Возвращаем состояние с данными
    yield DataScreenCharactersState(
      charactersList: results,
      isList: isList,
    );
  }

  Stream<ScreenCharactersState> _mapChangeViewScreenCharactersEvent(ChangeViewScreenCharactersEvent event) async* {
    yield LoadingScreenCharactersState();
    isList = !event.isList;
    yield DataScreenCharactersState(
      charactersList: results,
      isList: isList,
    );
  }
}





