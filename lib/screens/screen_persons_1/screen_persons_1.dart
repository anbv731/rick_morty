import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rick_morty/components/search.dart';
import 'package:rick_morty/data/person.dart';
import 'package:rick_morty/screens/screen_persons_2/screen_persons_2.dart';

import '../../theme/color_theme.dart';

class Persons1 extends StatelessWidget {
  List<Person> persons = Person.persons;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.background,
      body: SafeArea(
        child: Column(
          children: [
            Search(),
            ListTile(
                leading: Text('ВСЕГО ПЕРСОНАЖЕЙ: ${persons.length}',
                    style: TextStyle(color: ThemeColors.text2, fontSize: 16)),
                trailing: InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Persons2()));
                    },
                    child: SvgPicture.asset('assets/svg_icons/group.svg'))),
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: persons.length,
                  itemBuilder: (_, index) {
                    return Padding(
                      padding: const EdgeInsets.only(
                          left: 16, bottom: 24, right: 16),
                      child: Row(
                        children: [
                          ClipOval(
                            child: Image.asset(
                              persons[index].picture,
                              fit: BoxFit.contain,
                            ),
                          ),
                          SizedBox(
                            width: 18,
                          ),
                          Column(
                            children: [
                              if (persons[index].status)
                                Text('живой',
                                    style: TextStyle(color: Colors.greenAccent))
                              else
                                Text('мертвый',
                                    style: TextStyle(color: Colors.red)),
                              Text(
                                persons[index].name,
                                style: TextStyle(
                                    fontSize: 16, color: ThemeColors.text1),
                              ),
                              Text(persons[index].description,
                                  style: TextStyle(
                                      fontSize: 12, color: ThemeColors.text2)),
                            ],
                            crossAxisAlignment: CrossAxisAlignment.start,
                          ),
                        ],
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
