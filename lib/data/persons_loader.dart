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
}



Future<List<Person>> loadPerson() async {
  Response response = await http.get(
    Uri.parse('https://rickandmortyapi.com/api/character'),
  );
  List<Person> results = [];
  if (response.statusCode == 200) {
    List<dynamic> resultsList = convert.jsonDecode(response.body)['results'];
    for (var result in resultsList) {
      Person person = Person();
      person.id = result['id'];
      person.name = result['name'];
      person.status = result['status'];
      person.url = result['url'];
      person.image = result['image'];
      person.species= result['species'];
      person.gender= result ['gender'];
      results.add(person);
    }

    return results;
  }

}