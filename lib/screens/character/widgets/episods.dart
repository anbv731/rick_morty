import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rick_morty/screens/episodes/screen.dart';
import 'package:rick_morty/screens/splash_screen/screen.dart';
import 'package:rick_morty/theme/color_theme.dart';
import 'package:rick_morty/theme/text_theme.dart';

class ListEpisods extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 24),
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
            (index) => Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: InkWell(
                onTap: (){},
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 16),
                      height: 74,
                      width: 74,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                      child: Image.asset('assets/images/episod1.png'),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('CЕРИЯ 1', style: ThemeText.episods),
                          Text(
                            'Пилот',
                            style: ThemeText.name,
                          ),
                          Text('1 декабря 2013', style: ThemeText.date),
                        ],
                      ),
                    ),
                    SvgPicture.asset('assets/svg_icons/vector.svg'),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
