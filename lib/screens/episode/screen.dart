import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rick_morty/components/characters_list/characters_list.dart';
import 'package:rick_morty/components/temporary_list_characters.dart';
import 'package:rick_morty/components/temporary_list_episodes.dart';
import 'package:rick_morty/data/episode_model.dart';
import 'package:rick_morty/data/person_model.dart';
import 'package:rick_morty/screens/characters/widgets/persons_list.dart';
import 'package:rick_morty/screens/location/screen.dart';
import 'package:rick_morty/theme/color_theme.dart';
import 'package:rick_morty/theme/text_theme.dart';

class ScreenEpisode extends StatelessWidget {
  ScreenEpisode(this.episode);

  List<Person> _list = TempLists.tempListPer;
  Episode episode = Episode();
  String loadingCharactersList;
  List<String> month = [
    'января',
    'февраля',
    'марта',
    'апреля',
    'мая',
    'июня',
    'июля',
    'августа',
    'сентября',
    'октября',
    'ноября',
    'декабря'
  ];

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
                  backgroundColor: ThemeColors.search1,
                  elevation: 1,
                  onPressed: () => {Navigator.pop(context)},
                  child: SvgPicture.asset('assets/svg_icons/arrow_back.svg'),
                ),
              ),
            ),
          ),
        ),
        backgroundColor: ThemeColors.background,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.topCenter,
                clipBehavior: Clip.none,
                children: <Widget>[
                  Column(
                    children: [
                      Image.network(episode.imageName,
                          height: 298,
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.cover),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.only(left: 16, right: 16),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                            color: ThemeColors.background),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 68),
                              child: Text(
                                episode.plot,
                                style: ThemeText.description,
                                textAlign: TextAlign.left,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 24, bottom: 4),
                              child: Text(
                                'Премьера',
                                style: ThemeText.fieldDescription,
                              ),
                            ),
                            Text(
                                '${episode.premiere.day} ${month[episode.premiere.month - 1]} ${episode.premiere.year}',
                                style: ThemeText.description1),
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
                            Padding(
                              padding: const EdgeInsets.only(bottom: 24),
                              child: Text(
                                'Персонажи',
                                style: ThemeText.location,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    top: 251,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.only(top: 34, left: 16, right: 16),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          color: ThemeColors.background),
                      child: Column(
                        children: [
                          Text(
                            episode.name,
                            textAlign: TextAlign.center,
                            style: ThemeText.locationName,
                          ),
                          Text('Серия ${episode.series}',
                              style: ThemeText.episods),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              CharactersList(argument: episode, isScrollable: false),
            ],
          ),
        ));
  }
}
