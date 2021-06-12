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


// Future<List<Person>> loadPerson() async {
//   Response response = await http.get(
//     Uri.parse('https://rickandmortyapi.com/api/character'),
//   );
//   List<Person> results = [];
//   if (response.statusCode == 200) {
//     List<dynamic> resultsList = convert.jsonDecode(response.body)['results'];
//     for (var result in resultsList) {
//       Person person = Person();
//       person.id = result['id'];
//       person.name = result['name'];
//       person.status = result['status'];
//       person.url = result['url'];
//       person.image = result['image'];
//       person.species= result['species'];
//       person.gender= result ['gender'];
//       person.origin=result['origin'] != null ? Origin.fromJson(result['origin']) : null;
//       person.location=result['location'] != null ? Origin.fromJson(result['location']) : null;
//       results.add(person);
//     }
//
//     return results;
//   }
//
// }