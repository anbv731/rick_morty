import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'dart:convert' as convert;

  class Location {
    Location({
  this.id,
  this.name,
  this.type,
  this.measurements,
  this.about,
  this.imageName,
  this.characters,
  this.placeOfBirthCharacters,
  });

  String id;
  String name;
  String type;
  String measurements;
  String about;
  String imageName;
  List<dynamic> characters;
  List<dynamic> placeOfBirthCharacters;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
  id: json["id"],
  name: json["name"],
  type: json["type"],
  measurements: json["measurements"],
  about: json["about"],
  imageName: json["imageName"],
  characters: List<dynamic>.from(json["characters"].map((x) => x)),
  placeOfBirthCharacters: List<dynamic>.from(json["placeOfBirthCharacters"].map((x) => x)),
  );

  }