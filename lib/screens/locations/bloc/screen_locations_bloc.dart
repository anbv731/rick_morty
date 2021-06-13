
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:rick_morty/components/temporary_list_episodes.dart';
import 'package:rick_morty/data/location_model.dart';
import 'package:rick_morty/screens/locations/bloc/screen_locations_event.dart';
import 'dart:convert' as convert;
import 'package:rick_morty/screens/locations/bloc/screen_locations_state.dart';

class ScreenLocationsBloc
    extends Bloc<ScreenLocationsEvent, ScreenLocationsState> {
  ScreenLocationsBloc() : super(InitialScreenLocationsState());


  @override
  Stream<ScreenLocationsState> mapEventToState(
      ScreenLocationsEvent event,
      ) async* {
    if (event is LoadingScreenLocationsEvent){
      yield* _mapLoadingScreenLocationsEvent();
    }
  }

  Stream<ScreenLocationsState> _mapLoadingScreenLocationsEvent() async* {
    yield LoadingScreenLocationsState();
    List<Location> locations = [];
    try {
      http.Response response = await http.get(
        Uri.parse('https://rickandmortyapi.com/api/location'),
      );
      if (response.statusCode == 200) {
        List<dynamic> locationsList = convert.jsonDecode(
            response.body)['results'];
        for (var result in locationsList) {
          Location location = Location();
          location.id = result['id'];
          location.name = result['name'];
          location.type = result['type'];
          location.url = result['url'];
          location.dimension = result['dimension'];
          location.residents = List<String>.from(result['residents']);
          location.created = result ['created'];
          locations.add(location);
        }
      }
    }
    catch (ex) {
      print(ex);
      yield ErrorScreenLocationsState();
    }
    TempLists.tempListLoc = locations;

    /// Возвращаем состояние с данными
    yield DataScreenLocationsState(
      locationsList: locations,

    );
  }
}





