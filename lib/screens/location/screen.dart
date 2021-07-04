import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rick_morty/components/characters_list/characters_list.dart';
import 'package:rick_morty/components/dio_settings.dart';
import 'package:rick_morty/components/loading_screen.dart';
import 'package:rick_morty/components/service_api.dart';
import 'package:rick_morty/components/temporary_list_characters.dart';
import 'package:rick_morty/components/temporary_list_episodes.dart';
import 'package:rick_morty/data/location_model.dart';
import 'package:rick_morty/data/person_model.dart';
import 'package:rick_morty/screens/characters/widgets/persons_list.dart';
import 'package:rick_morty/theme/color_theme.dart';
import 'package:rick_morty/theme/text_theme.dart';

class ScreenLocation extends StatelessWidget {
  ScreenLocation({this.location, this.id});

  Location location;
  String id;

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
        body: location == null
            ? FutureBuilder(
                future: ServiceApi().getLocationOnly(id),
                builder: (_, AsyncSnapshot<Location> snapshot) => snapshot.hasData ?
                    ScreenBody(snapshot.data): LoadingScreen(),
              )
            : ScreenBody(location));
  }
}

class ScreenBody extends StatelessWidget {
  ScreenBody(this.location);

  final Location location;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            alignment: Alignment.topCenter,
            clipBehavior: Clip.none,
            children: <Widget>[
              Column(
                children: [
                  Image.network(location.imageName,
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
                          padding: const EdgeInsets.only(top: 22),
                          child: Text(
                            '${location.type} · ${location.measurements}',
                            style: ThemeText.fieldDescription,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 32),
                          child: Text(
                            location.about,
                            style: ThemeText.description,
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 36, bottom: 24),
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
                  child: Text(
                    location.name,
                    style: ThemeText.locationName,
                  ),
                ),
              ),
            ],
          ),
          CharactersList(argument: location, isScrollable: false),
        ],
      ),
    );
  }
}
