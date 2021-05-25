import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rick_morty/theme/text_theme.dart';

import '../../../data/persons_loader.dart';
import '../../../theme/color_theme.dart';
import '../../character/screen.dart';

class PersonsList extends StatelessWidget {
  List<Person> persons;

  PersonsList({this.persons});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: persons?.length ?? 0,
        itemBuilder: (_, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 16, bottom: 24, right: 16),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: (context) => Character(persons[index])));
              },
              child: Row(
                children: [
                  SizedBox(
                    width: 74,
                    height: 74,
                    child: ClipOval(
                      child: Image.network(
                        persons[index].image,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 18,
                  ),
                  Column(
                    children: [
                      Text(persons[index].status, style: ThemeText.green),
                      Text(
                        persons[index].name,
                        style: ThemeText.name,
                      ),
                      Text(
                          '${persons[index].species} , ${persons[index].gender}',
                          style: ThemeText.fieldDescription),
                    ],
                    crossAxisAlignment: CrossAxisAlignment.start,
                  ),
                ],
              ),
            ),
          );
        });
  }
}
