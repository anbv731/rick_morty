import 'package:dio/dio.dart';
import 'package:rick_morty/components/dio_settings.dart';
import 'package:rick_morty/data/episode_model.dart';
import 'package:rick_morty/data/location_model.dart';
import 'package:rick_morty/data/person_model.dart';
import 'package:rick_morty/screens/location/screen.dart';

class ServiceApi {
  DioSettings _dioSettings;
  Dio _dio;

  Map<String, dynamic> _request;
  static ServiceApi _instance = ServiceApi.internal();

  factory ServiceApi() => _instance;

  ServiceApi.internal() {
    _dioSettings = DioSettings();
    _dio = _dioSettings.dio;
  }

  Future<List<Person>> getCharacters() async {
    final response = await _dio.get('Characters/GetAll?PageNumber=1&PageSize=50');
    final results = (response.data)['data']
        .map((element) => Person.fromJson(element))
        .toList();

    return List<Person>.from(results);
  }

  Future<List<Episode>> getEpisodes() async {
    final response = await _dio.get('Episodes/GetAll?PageNumber=1&PageSize=50');
    final results = (response.data)['data']
        .map((element) => Episode.fromJson(element))
        .toList();

    return List<Episode>.from(results);
  }

  Future<List<Location>> getLocations() async {
    final response = await _dio.get('Locations/GetAll?PageNumber=1&PageSize=50');
    final results = (response.data)['data']
        .map((element) => Location.fromJson(element))
        .toList();

    return List<Location>.from(results);
  }
  Future<Location> getLocationOnly(String id ) async {
    final response = await _dio.get('Locations/GetById?Id=$id');
    return Location.fromJson((response.data)['data']);
  }
}


