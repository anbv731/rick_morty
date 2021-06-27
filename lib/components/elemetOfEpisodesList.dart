import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rick_morty/data/episode_model.dart';
import 'package:rick_morty/screens/episode/screen.dart';
import 'package:rick_morty/theme/text_theme.dart';

class ElementOfEpisodesList extends StatelessWidget {
  ElementOfEpisodesList(this.arrow, this.episode);

  Episode episode;
  bool arrow;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24, left: 16, right: 16),
      child: InkWell(
        onTap: () {
          Navigator.push(context,
              CupertinoPageRoute(builder: (context) => ScreenEpisode(episode)));
        },
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
                  Text('Серия ${episode.id}', style: ThemeText.episods),
                  Text(
                    episode.name,
                    style: ThemeText.name,
                  ),
                  Text(episode.premiere.timeZoneName, style: ThemeText.date),
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
