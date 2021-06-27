import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rick_morty/data/person_model.dart';
import 'package:rick_morty/screens/character/screen.dart';
import 'package:rick_morty/theme/text_theme.dart';

class ElementOfCharectersList extends StatelessWidget {
  ElementOfCharectersList(this.isArrow, this.person);

  bool isArrow;
  Person person;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, bottom: 24, right: 16),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context,
              CupertinoPageRoute(builder: (context) => Character(person)));
        },
        child: Row(
          children: [
            SizedBox(
              width: 74,
              height: 74,
              child: ClipOval(
                child: Image.network(
                  person.imageName,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              width: 18,
            ),
            Expanded(
              child: Column(
                children: [
                  if (person.status == 0)
                    (Text('ЖИВОЙ', style: ThemeText.green))
                  else
                    (Text('МЕРТВЫЙ', style: ThemeText.red)),
                  Text(person.fullName,
                    style: ThemeText.name,
                  ),
                  Text('${person.race} , ${person.gender}',
                      style: ThemeText.fieldDescription),
                ],
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
            ),
            isArrow
                ? SvgPicture.asset('assets/svg_icons/vector.svg')
                : SizedBox()
          ],
        ),
      ),
    );
  }
}
