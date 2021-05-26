import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:http/http.dart' as http;
import 'package:rick_morty/data/person_model.dart';
import 'package:rick_morty/screens/screen_characters/bloc/screen_characters_event.dart';
import 'dart:convert' as convert;
import 'package:rick_morty/screens/screen_characters/bloc/screen_characters_state.dart';

part 'screen_characters_bloc.freezed.dart';

class ScreenCharactersBloc
    extends Bloc<ScreenCharactersEvent, ScreenCharactersState> {
  ScreenCharactersBloc() : super(ScreenCharactersState.initial());
  bool isList = true;
  List<Person> results = [];

  @override
  Stream<ScreenCharactersState> mapEventToState(
    ScreenCharactersEvent event,
  ) async* {
    yield* event.map(
      initial: (event) => _mapInitialScreenCharactersEvent(event),
      changeView: (event) => _mapChangeViewScreenCharactersEvent(event),
    );
  }

  Stream<ScreenCharactersState> _mapInitialScreenCharactersEvent(
      _InitialScreenCharactersEvent event) async* {
    yield ScreenCharactersState.loading();

    try {
      http.Response response = await http.get(
        Uri.parse('https://rickandmortyapi.com/api/character'),
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
          results.add(person);
        }
      }
    } catch (ex) {
      print(ex);
      yield ScreenCharactersState.error();
    }

    /// Возвращаем состояние с данными
    yield ScreenCharactersState.data(
      charactersList: results,
      isList: isList,
    );
  }

  Stream<ScreenCharactersState> _mapChangeViewScreenCharactersEvent(
      _ChangeViewScreenCharactersEvent event) async* {
    yield ScreenCharactersState.loading();
    isList = !event.isList;
    yield ScreenCharactersState.data(
      charactersList: results,
      isList: isList,
    );
  }
}

@freezed
abstract class ScreenCharactersState with _$ScreenCharactersState {
  const factory ScreenCharactersState.data({
    @required List<Person> charactersList,
    @required bool isList,
  }
  ) = _DataScreenCharactersState;

  const factory ScreenCharactersState.initial() = _InitialScreenCharactersState;

  const factory ScreenCharactersState.loading() = _LoadingScreenCharactersState;

  const factory ScreenCharactersState.error() = _ErrorScreenCharactersState;
}

@freezed
abstract class ScreenCharactersEvent with _$ScreenCharactersEvent {
  const factory ScreenCharactersEvent.initial() = _InitialScreenCharactersEvent;

  const factory ScreenCharactersEvent.changeView({
    @required bool isList,
  }
  ) = _ChangeViewScreenCharactersEvent;
}
