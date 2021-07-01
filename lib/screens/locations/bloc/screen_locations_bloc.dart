
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:rick_morty/components/service_api.dart';
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
    try { locations=await ServiceApi().getLocations();


    }
    catch (ex) {
      print(ex);
      yield ErrorScreenLocationsState();
    }

    /// Возвращаем состояние с данными
    yield DataScreenLocationsState(
      locationsList: locations,

    );
  }
}





