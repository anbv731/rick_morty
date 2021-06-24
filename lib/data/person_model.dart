import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:http/http.dart';

class Person {
  int id;
  String name;
  String status;
  String url;
  String image;
  String species;
  String gender;
  Origin origin;
  Origin location;
 List<dynamic> episode;
 Person({
    this.id,
   this.episode,
   this.location,
   this.name,
   this.species,
   this.status,
   this.gender,
   this.image,
   this.origin,
   this.url
});

  Person.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
    species = json['species'];
    gender = json['gender'];
   episode = json['episode'];
    origin = json['origin'] != null ? Origin.fromJson(json['origin']) : null;
    location =
        json['location'] != null ? Origin.fromJson(json['location']) : null;
    image = json['image'];
    url = json['url'];
  }
}

class Origin {
  String name;
  String url;

  Origin({this.name, this.url});

  Origin.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }
}

