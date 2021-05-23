import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../data/persons_loader.dart';
import '../../../theme/color_theme.dart';
import '../../character/screen.dart';

class PersonsGrid extends StatelessWidget {
  List<Person> persons;

  PersonsGrid({this.persons});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 24,
            crossAxisSpacing: 18),
        itemCount: persons?.length ?? 0,
        itemBuilder: (_, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  CupertinoPageRoute(
                      builder: (context) =>
                          Character(persons[index])));
            },
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 18),
                  child: SizedBox(
                    height: 120,
                    width: 120,
                    child: ClipOval(
                      child: Image.network(
                        persons[index].image,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                Text(persons[index].status,
                    style: TextStyle(color: Colors.greenAccent)),
                Text(
                  persons[index].name,
                  style: TextStyle(
                      fontSize: 16, color: ThemeColors.text1),
                ),
                Text(
                    '${persons[index].species} , ${persons[index].gender}',
                    style: TextStyle(
                        fontSize: 12, color: ThemeColors.text2)),
              ],
            ),
          );
        });
  }
}