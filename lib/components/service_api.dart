import 'package:dio/dio.dart';
import 'package:rick_morty/components/dio_settings.dart';

class ServiceApi {
   DioSettings _dioSettings;
  Dio _dio;

  Map<String, dynamic> _request;
  static ServiceApi _instance = new ServiceApi.internal();
  factory ServiceApi() => _instance;
  ServiceApi.internal() {
    _dioSettings = DioSettings();
    _dio = _dioSettings.dio;
  }

  // Название запроса
  Future getCharacters() async {
  final response = await _dio.get(
  "#get-all-characters",
  );

  return CharactersFromJson(response.toString());

}

}
class CharactersFromJson {
  String response;
  CharactersFromJson(response);


  }

