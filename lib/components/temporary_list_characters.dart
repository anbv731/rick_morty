import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rick_morty/screens/character/screen.dart';
import 'package:rick_morty/screens/characters/bloc/screen_characters_bloc.dart';
import 'package:rick_morty/screens/characters/screen.dart';
import 'package:rick_morty/theme/text_theme.dart';

class TemporaryListCharacters extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ...List.generate(
        6,
            (index) => Padding(
          padding: const EdgeInsets.only(left: 16, top: 24, right: 16),
          child: GestureDetector(

              onTap: (){

                Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: (context) => ScreenCharacters()));
              },

            child: Row(
              children: [
                SizedBox(
                  width: 74,
                  height: 74,
                  child: ClipOval(
                    child: Image.asset(
                      'assets/images/morty.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 18,
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text('ЖИВОЙ', style: ThemeText.green),
                      Text(
                        'Морти Смитт',
                        style: ThemeText.name,
                      ),
                      Text('Человек , Мужской',
                          style: ThemeText.fieldDescription),
                    ],
                    crossAxisAlignment: CrossAxisAlignment.start,
                  ),
                ),
                SvgPicture.asset('assets/svg_icons/vector.svg'),
              ],

            ),
          ),
        ),
      ),
    ]);
  }
}