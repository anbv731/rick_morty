import 'package:dio/dio.dart';
import 'package:rick_morty/components/dio_settings.dart';
import 'dart:convert' as convert;

import 'package:rick_morty/data/person_model.dart';

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

  // Название запроса
  Future<List<Person>> getCharacters() async {
  final response = await _dio.get('https://www.google.com');

  List<Person> results = [];

  List<Map<String, dynamic>> resultsList =
  convert.jsonDecode(response.data)['results'];
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
  return results;

}

}

