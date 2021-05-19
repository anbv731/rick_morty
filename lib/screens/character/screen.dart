import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:rick_morty/data/persons_loader.dart';
import 'package:rick_morty/screens/character/widgets/avatar.dart';
import 'package:rick_morty/screens/character/widgets/description.dart';
import 'package:rick_morty/screens/character/widgets/episods.dart';
import 'package:rick_morty/theme/color_theme.dart';

class Character extends StatelessWidget {
  Character(this.person);

  Person person = Person();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Avatar(person),
            Description(person),
            Padding(
              padding: EdgeInsets.only(
                top: 36,
                bottom: 36,
              ),
              child: Divider(
                thickness: 1,
                color: ThemeColors.text2,
              ),
            ),
            ListEpisods(),
          ],
        ),
      ),
    );
  }
}
