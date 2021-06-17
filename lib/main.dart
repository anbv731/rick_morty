import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rick_morty/screens/characters/screen.dart';
import 'package:rick_morty/screens/episode/screen.dart';
import 'package:rick_morty/screens/episodes/screen.dart';
import 'package:rick_morty/screens/location/screen.dart';
import 'package:rick_morty/screens/locations/screen.dart';
import 'package:rick_morty/screens/settings/screen.dart';
import 'package:rick_morty/screens/settings/widgets/dialog_screen.dart';
import 'package:rick_morty/screens/splash_screen/screen.dart';
import 'package:rick_morty/theme/color_theme.dart';
import 'package:rick_morty/theme/text_theme.dart';

import 'components/service_api.dart';
import 'data/person_model.dart';

void main() {

  List<Widget> screensList = [
    ScreenCharacters(),
    ScreenLocations(),
    ScreenEpisodes(),
    ScreenSettings()
  ];

  ValueNotifier _selectedScreen = ValueNotifier<int>(0);
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ValueListenableBuilder(
          valueListenable: _selectedScreen,
          builder: (context, value, child) {
            return Scaffold(
                bottomNavigationBar: BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  currentIndex: value,
                  onTap: (int index) {
                    _selectedScreen.value = index;
                  },
                  backgroundColor: ThemeColors.search1,
                  selectedItemColor: ThemeColors.text3,
                  unselectedItemColor: ThemeColors.textdescript,
                  items: [
                    BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                          'assets/svg_icons/icon_characters.svg',
                          color: value == 0
                              ? ThemeColors.text3
                              : ThemeColors.textdescript),
                      label: 'Персонажи',
                    ),
                    BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                          'assets/svg_icons/icon_locations.svg',
                          color: value == 1
                              ? ThemeColors.text3
                              : ThemeColors.textdescript),
                      label: 'Локации',
                    ),
                    BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                          'assets/svg_icons/icon_episodes.svg',
                          color: value == 2
                              ? ThemeColors.text3
                              : ThemeColors.textdescript),
                      label: 'Эпизоды',
                    ),
                    BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                          'assets/svg_icons/icon_settings.svg',
                          color: value == 3
                              ? ThemeColors.text3
                              : ThemeColors.textdescript),
                      label: 'Настройки',
                    ),
                  ],
                ),
                body: screensList[_selectedScreen.value]);
          }),
    ),
  );
}
