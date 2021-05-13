import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rick_morty/components/search.dart';
import 'package:rick_morty/data/person.dart';
import 'package:rick_morty/theme/color_theme.dart';

class Persons2 extends StatelessWidget {
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
                trailing: Icon(
                  Icons.list,
                  color: ThemeColors.text2,
                )),
            Expanded(
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 24,
                      crossAxisSpacing: 18),
                  itemCount: persons.length,
                  itemBuilder: (_, index) {
                    return Column(
                      children: [
                        SizedBox(
                          height: 120,
                          width: 120,
                          child: ClipOval(
                            child: Image.asset(
                              persons[index].picture,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 18,
                          width: 3,
                        ),
                        if (persons[index].status)
                          Text('живой',
                              style: TextStyle(color: Colors.greenAccent))
                        else
                          Text('мертвый', style: TextStyle(color: Colors.red)),
                        Text(
                          persons[index].name,
                          style:
                              TextStyle(fontSize: 16, color: ThemeColors.text1),
                        ),
                        Text(persons[index].description,
                            style: TextStyle(
                                fontSize: 12, color: ThemeColors.text2)),
                      ],
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
