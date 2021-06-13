import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'dart:convert' as convert;
class Location {
  int id;
  String name;
  String type;
  String episode;
  List<String> residents;
  String dimension;
  String url;
  String created;

  Location(
      {this.id,
        this.name,
        this.type,
        this.episode,
        this.dimension,
        this.url,
        this.created});
}
