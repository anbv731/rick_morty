import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
            person.name,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 34,
                height: 40 / 34,
                fontWeight: FontWeight.w400,
                color: Colors.white),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(person.status, style: ThemeText.green),
          const SizedBox(
            height: 36,
          ),
          Text(
            'Главный протагонист мультсериала "Рик  и Морти". Безумный ученый,чей алкоголизм, безрассудство и социопатия заставляют беспокоится семью его дочери.',
            textAlign: TextAlign.left,
            style: ThemeText.description,
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
                        Text('Пол:', style: ThemeText.fieldDescription),
                        Text('${person.gender}', style: ThemeText.description1),
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
                        Text('Раса:', style: ThemeText.fieldDescription),
                        Text('${person.species}',
                            style: ThemeText.description1),
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
                  Navigator.push(context,
                      CupertinoPageRoute(builder: (context) => ScreenLocations()));
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
                                style: ThemeText.fieldDescription),
                            Text('${person.origin.name}',
                                style: ThemeText.description1),
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
          InkWell(
            onTap: () {
              Navigator.push(context,
                  CupertinoPageRoute(builder: (context) => ScreenLocations()));
            },
            child: SizedBox(
              height: 50,
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Местоположение:',
                            style: ThemeText.fieldDescription),
                        Text('${person.location.name}',
                            style: ThemeText.description1),
                      ],
                    ),
                  ),
                  SvgPicture.asset('assets/svg_icons/vector.svg'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
