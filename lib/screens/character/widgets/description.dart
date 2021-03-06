import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rick_morty/components/service_api.dart';
import 'package:rick_morty/data/location_model.dart';
import 'package:rick_morty/data/person_model.dart';
import 'package:rick_morty/screens/location/screen.dart';
import 'package:rick_morty/screens/locations/screen.dart';
import 'package:rick_morty/theme/text_theme.dart';

class Description extends StatelessWidget {
  Description(this.person);

  Person person;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Column(
        children: [
          Text(
            person.fullName,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline4,
          ),
          const SizedBox(
            height: 4,
          ),
          if (person.status == 0)
            (Text('ЖИВОЙ', style: ThemeText.green))
          else
            (Text('МЕРТВЫЙ', style: ThemeText.red)),
          const SizedBox(
            height: 36,
          ),
          Text(
            '${person.about}',
            textAlign: TextAlign.left,
            style: Theme.of(context).textTheme.headline5,
          ),
          const SizedBox(
            height: 24,
          ),
          Row(
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                    height: 40,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Пол:', style: Theme.of(context).textTheme.caption),
                        Text('${person.gender}', style: Theme.of(context).textTheme.bodyText2),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                    height: 40,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Раса:', style: Theme.of(context).textTheme.caption),
                        Text('${person.race}', style: Theme.of(context).textTheme.bodyText2),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: InkWell(
              onTap: () {},
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => ScreenLocation(
                                id: person.placeOfBirthId,
                              )));
                },
                child: SizedBox(
                  height: 50,
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Место рождения:',
                                style: Theme.of(context).textTheme.caption),
                            Text('${person.placeOfBirth}',
                                style: Theme.of(context).textTheme.bodyText2),
                          ],
                        ),
                      ),
                      SvgPicture.asset('assets/svg_icons/vector.svg'),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
