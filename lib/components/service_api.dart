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
    final response = await _dio.get('character');
    final results = (response.data)['results']
        .map((element) => Person.fromJson(element))
        .toList();

    return List<Person>.from(results);
  }

  Future<List<Episode>> getEpisodes() async {
    final response = await _dio.get('episode');
    final results = (response.data)['results']
        .map((element) => Episode.fromJson(element))
        .toList();

    return List<Episode>.from(results);
  }

  Future<List<Location>> getLocations() async {
    final response = await _dio.get('location');
    final results = (response.data)['results']
        .map((element) => Location.fromJson(element))
        .toList();

    return List<Location>.from(results);
  }

  Future<List<Person>> getCharactersOnly(String loadingCharactersList) async {
    final response = await _dio.get('character/$loadingCharactersList');
    final results = response.data
        .map((element) => Person.fromJson(element))
        .toList();

    return List<Person>.from(results);
  }
  Future<List<Episode>> getEpisodesOnly(String loadingEpisodesList) async {
    final response = await _dio.get('episode/$loadingEpisodesList');
    final results = (response.data)['results']
        .map((element) => Episode.fromJson(element))
        .toList();

    return List<Episode>.from(results);
  }
}

