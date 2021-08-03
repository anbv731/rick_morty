import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rick_morty/data/person_model.dart';
import 'package:rick_morty/screens/character/widgets/avatar.dart';
import 'package:rick_morty/screens/character/widgets/description.dart';
import 'package:rick_morty/screens/character/widgets/list_characters_episodes.dart';
import 'package:rick_morty/theme/color_theme.dart';

class Character extends StatelessWidget {
  Character(this.person);
  Person person;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(102),
        child: AppBar(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          automaticallyImplyLeading: false,
          flexibleSpace: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 24, top: 40),
              child: FloatingActionButton(
                backgroundColor: Theme.of(context).dividerColor,
                elevation: 1,
                onPressed: () => {Navigator.pop(context)},
                child: SvgPicture.asset('assets/svg_icons/arrow_back.svg'),
              ),
            ),
          ),
        ),
      ),
      backgroundColor: Theme.of(context).primaryColor,
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
                color: Theme.of(context).dividerColor,
              ),
            ),
            ListCharactersEpisodes(person),
          ],
        ),
      ),
    );
  }
}
