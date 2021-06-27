import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:http/http.dart';
import 'package:rick_morty/data/episode_model.dart';

// class Person {
//   int id;
//   String name;
//   String status;
//   String url;
//   String image;
//   String species;
//   String gender;
//   Origin origin;
//   Origin location;
//
//   Person.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     status = json['status'];
//     species = json['species'];
//     gender = json['gender'];
//     origin = json['origin'] != null ? Origin.fromJson(json['origin']) : null;
//     location =
//         json['location'] != null ? Origin.fromJson(json['location']) : null;
//     image = json['image'];
//     url = json['url'];
//   }
// }
//
// class Origin {
//   String name;
//   String url;
//
//   Origin({this.name, this.url});
//
//   Origin.fromJson(Map<String, dynamic> json) {
//     name = json['name'];
//     url = json['url'];
//   }
// }


// class Person {
//   String id;
//   String firstName;
//   String lastName;
//   String fullName;
//   int status;
//   String about;
//   int gender;
//   String race;
//   String imageName;
//   String placeOfBirthId;
//   String placeOfBirth;
//   List<Episodes> episodes;
//
//   Person({this.id,
//     this.firstName,
//     this.lastName,
//     this.fullName,
//     this.status,
//     this.about,
//     this.gender,
//     this.race,
//     this.imageName,
//     this.placeOfBirthId,
//     this.placeOfBirth,
//     this.episodes});
//
//   Person.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     firstName = json['firstName'];
//     lastName = json['lastName'];
//     fullName = json['fullName'];
//     status = json['status'];
//     about = json['about'];
//     gender = json['gender'];
//     race = json['race'];
//     imageName = json['imageName'];
//     placeOfBirthId = json['placeOfBirthId'];
//     placeOfBirth = json['placeOfBirth'];
//     if (json['episodes'] != null) {
//       episodes =  [];
//       json['episodes'].forEach((v) {
//         episodes.add(new Episodes.fromJson(v));
//       });
//     }
//   }
// }
//   class Episodes {
//     String id;
//     String name;
//
//     Episodes({this.id, this.name});
//
//     Episodes.fromJson(Map<String, dynamic> json) {
//       id = json['id'];
//       name = json['name'];
//     }
//   }




class Person {
  Person({
    this.id,
    this.firstName,
    this.lastName,
    this.fullName,
    this.status,
    this.about,
    this.gender,
    this.race,
    this.imageName,
    this.placeOfBirthId,
    this.placeOfBirth,
    this.episodes,
  });

  String id;
  String firstName;
  String lastName;
  String fullName;
  int status;
  String about;
  String gender;
  String race;
  String imageName;
  String placeOfBirthId;
  String placeOfBirth;
  List<CharacterEpisode> episodes;

  factory Person.fromJson(Map<String, dynamic> json) => Person(
    id: json["id"],
    firstName: json["firstName"],
    lastName: json["lastName"] == null ? null : json["lastName"],
    fullName: json["fullName"],
    status: json["status"],
    about: json["about"],
    gender:  json["gender"]==0 ? 'Мужской' : json["gender"]==1? "Женский":"Неизвестно",
    race: json["race"],
    imageName: json["imageName"],
    placeOfBirthId: json["placeOfBirthId"] == null ? null : json["placeOfBirthId"],
    placeOfBirth: json["placeOfBirth"] ,
    episodes: List<CharacterEpisode>.from(json["episodes"].map((x) => CharacterEpisode.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "firstName": firstName,
    "lastName": lastName == null ? null : lastName,
    "fullName": fullName,
    "status": status,
    "about": about,
    "gender": gender,
    "race": race,
    "imageName": imageName,
    "placeOfBirthId": placeOfBirthId == null ? null : placeOfBirthId,
    "placeOfBirth": placeOfBirth == null ? null : placeOfBirthValues.reverse[placeOfBirth],
    "episodes": List<dynamic>.from(episodes.map((x) => x.toJson())),
  };
}

class CharacterEpisode {
  CharacterEpisode({
    this.id,
    this.name,
  });

  String id;
  String name;

  factory CharacterEpisode.fromJson(Map<String, dynamic> json) => CharacterEpisode(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}

enum PlaceOfBirth { EMPTY, PLACE_OF_BIRTH, C_137, PURPLE, FLUFFY }

final placeOfBirthValues = EnumValues({
  "Измерение C-137": PlaceOfBirth.C_137,
  "Постапокалиптическое измерение": PlaceOfBirth.EMPTY,
  "Птичий мир": PlaceOfBirth.FLUFFY,
  "Земля": PlaceOfBirth.PLACE_OF_BIRTH,
  "Громфлом": PlaceOfBirth.PURPLE
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
