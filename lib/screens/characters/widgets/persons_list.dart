import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rick_morty/components/element_of_characters_list.dart';
import '../../../data/person_model.dart';

class PersonsList extends StatelessWidget {
  List<Person> persons;
  bool isScrollable;
  PersonsList({this.persons,this.isScrollable});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(padding: EdgeInsets.only(top:0),
      physics: isScrollable ? AlwaysScrollableScrollPhysics() : NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: persons?.length ?? 0,
        itemBuilder: (_, position) {
          return ElementOfCharectersList(true, persons[position]);
        });
  }
}
