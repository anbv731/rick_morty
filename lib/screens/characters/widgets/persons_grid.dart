import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rick_morty/theme/text_theme.dart';

import '../../../data/person_model.dart';
import '../../../theme/color_theme.dart';
import '../../character/screen.dart';

class PersonsGrid extends StatelessWidget {
  List<Person> persons;

  PersonsGrid({this.persons});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 0.85),
        itemCount: persons?.length ?? 0,
        itemBuilder: (_, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  CupertinoPageRoute(
                      builder: (context) => Character(persons[index])));
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
                        persons[index].imageName,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                if (persons[index].status == 0)
                  (Text('ЖИВОЙ', style: ThemeText.green))
                else
                  (Text('МЕРТВЫЙ', style: ThemeText.green)),
                Text(
                  persons[index].fullName,
                  style: Theme.of(context).textTheme.headline2,
                ),
                Text('${persons[index].race} , ${persons[index].gender}',
                    style: Theme.of(context).textTheme.headline5,),
              ],
            ),
          );
        });
  }
}
