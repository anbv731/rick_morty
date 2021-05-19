import 'package:flutter/material.dart';
import 'package:rick_morty/data/persons_loader.dart';
import 'package:rick_morty/theme/color_theme.dart';

class Description extends StatelessWidget {
  Description(this.person);

  Person person = Person();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16,right: 16),
      child: Column(
        children: [
          Text(
            person.name,
            style: TextStyle(fontSize: 34, color: Colors.white),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            person.status,
            style: TextStyle(fontSize: 10, color: Colors.greenAccent),
          ),
          SizedBox(
            height: 36,
          ),
          Text(
            'Главный протагонист мультсериала "Рик  и Морти". Безумный ученый,чей алкоголизм, безрассудство и социопатия заставляют беспокоится семью его дочери.',
            textAlign: TextAlign.left,
            style: TextStyle(color: Colors.white, fontSize: 13),
          ),
          SizedBox(
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
                        Text('Пол:',
                            style: TextStyle(
                                fontSize: 12, color: ThemeColors.text2)),
                        Text('${person.gender}',
                            style: TextStyle(fontSize: 14, color: Colors.white)),
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
                        Text('Раса:',
                            style: TextStyle(
                                fontSize: 12, color: ThemeColors.text2)),
                        Text('${person.species}',
                            style: TextStyle(fontSize: 14, color: Colors.white)),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: SizedBox(
              height: 36,
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Место рождения:',
                            style: TextStyle(
                                fontSize: 12, color: ThemeColors.text2)),
                        Text('${person.origin.name}',
                            style: TextStyle(fontSize: 14, color: Colors.white)),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 10,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 36,
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Местоположение:',
                          style:
                              TextStyle(fontSize: 12, color: ThemeColors.text2)),
                      Text('${person.location.name}',
                          style: TextStyle(fontSize: 14, color: Colors.white)),
                    ],
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 10,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
