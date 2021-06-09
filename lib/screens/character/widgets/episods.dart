import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rick_morty/components/elemetOfEpisodesList.dart';
import 'package:rick_morty/screens/episodes/screen.dart';
import 'package:rick_morty/screens/splash_screen/screen.dart';
import 'package:rick_morty/theme/color_theme.dart';
import 'package:rick_morty/theme/text_theme.dart';

class ListEpisods extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  'Эпизоды',
                  style: TextStyle(
                      fontSize: 20, height: 28 / 20, color: Colors.white),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      CupertinoPageRoute(builder: (context) => Episodes()));
                },
                child: Text(
                  'Все эпизоды',
                  style: ThemeText.fieldDescription,
                ),
              ),
            ],
          ),
        ),
        ...List.generate(
          6,
          (index) => ElementOfEpisodesList(true),
        ),
      ],
    );
  }
}
