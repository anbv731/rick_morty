import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rick_morty/screens/episode/screen.dart';
import 'package:rick_morty/theme/text_theme.dart';

class ElementOfEpisodesList extends StatelessWidget {
  ElementOfEpisodesList(this.arrow);

  bool arrow;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24,left: 16, right: 16),
      child: InkWell(
        onTap: () {Navigator.push(
            context,
            CupertinoPageRoute(
                builder: (context) => Episode()));},
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
            arrow ? SvgPicture.asset('assets/svg_icons/vector.svg') : SizedBox()
          ],
        ),
      ),
    );
  }
}
