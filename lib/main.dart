import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
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
import 'package:rick_morty/theme/theme_manager.dart';

import 'components/service_api.dart';
import 'data/person_model.dart';
class MainScreen extends StatefulWidget {
  MainScreen({this.routeScreen});
  int routeScreen ;
  List<Widget> screensList = [
    ScreenCharacters(),
    ScreenLocations(),
    ScreenEpisodes(),
    ScreenSettings()
  ];


  @override
  State<StatefulWidget> createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  int selectedScreen ;
  @override
  void initState() {
    super.initState();
    
  selectedScreen = widget.routeScreen ?? 0;
  }


  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: selectedScreen,
          onTap: (int index) {
            setState(() {
              selectedScreen = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                  'assets/svg_icons/icon_characters.svg',
                  color: selectedScreen == 0
                      ? AppColors.green
                      : AppColors.gray
              ),
              label: 'Персонажи',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                  'assets/svg_icons/icon_locations.svg',
                  color: selectedScreen == 1
                      ? AppColors.green
                      : AppColors.textOverlineDark),
              label: 'Локации',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                  'assets/svg_icons/icon_episodes.svg',
                  color: selectedScreen == 2
                      ? AppColors.green
                      : AppColors.textOverlineDark),
              label: 'Эпизоды',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                  'assets/svg_icons/icon_settings.svg',
                  color: selectedScreen == 3
                      ? AppColors.green
                      : AppColors.textOverlineDark),
              label: 'Настройки',
            ),
          ],
        ),
        body: widget.screensList[selectedScreen]);
  }

  @override
  void didUpdateWidget(covariant MainScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget != oldWidget) {
      selectedScreen = widget.routeScreen ?? 0;
    }
  }

}
  void main() {
    // List<Widget> screensList = [
    //   ScreenCharacters(),
    //   ScreenLocations(),
    //   ScreenEpisodes(),
    //   ScreenSettings()
    // ];
    //
    // ValueNotifier _selectedScreen = ValueNotifier<int>(0);

    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    runApp(
      ChangeNotifierProvider<ThemeNotifier>(
        create: (_) => ThemeNotifier(),
        child: Consumer<ThemeNotifier>(
          builder: (context, theme, _) =>
              MaterialApp(
                theme: theme.getTheme(),
                title: 'Rick & Morty',
                debugShowCheckedModeBanner: false,
                initialRoute: '/',
                routes: {
                  '/':(context) => MainScreen(routeScreen: ModalRoute.of(context).settings.arguments,),
                  // When navigating to the "/" route, build the FirstScreen widget.
                  '/1': (context) => ScreenCharacters(),
                  // When navigating to the "/second" route, build the SecondScreen widget.
                  '/2': (context) => ScreenLocations(),
                  '/3': (context) => ScreenEpisodes(),
                  '/4': (context) => ScreenSettings(),

                },
                /*ValueListenableBuilder(
                  valueListenable: _selectedScreen,
                  builder: (context, value, child) {
                    ValueNotifier _selectedScreen = ValueNotifier<int>(0);
                    return Scaffold(
                        bottomNavigationBar: BottomNavigationBar(
                          type: BottomNavigationBarType.fixed,
                          currentIndex: value,
                          onTap: (int index) {
                            _selectedScreen.value = index
                            ;
                          },
                          items: [
                            BottomNavigationBarItem(
                              icon: SvgPicture.asset(
                                  'assets/svg_icons/icon_characters.svg',
                                  color: value == 0
                                      ? AppColors.green
                                      : AppColors.gray
                              ),
                              label: 'Персонажи',
                            ),
                            BottomNavigationBarItem(
                              icon: SvgPicture.asset(
                                  'assets/svg_icons/icon_locations.svg',
                                  color: value == 1
                                      ? AppColors.green
                                      : AppColors.textOverlineDark),
                              label: 'Локации',
                            ),
                            BottomNavigationBarItem(
                              icon: SvgPicture.asset(
                                  'assets/svg_icons/icon_episodes.svg',
                                  color: value == 2
                                      ? AppColors.green
                                      : AppColors.textOverlineDark),
                              label: 'Эпизоды',
                            ),
                            BottomNavigationBarItem(
                              icon: SvgPicture.asset(
                                  'assets/svg_icons/icon_settings.svg',
                                  color: value == 3
                                      ? AppColors.green
                                      : AppColors.textOverlineDark),
                              label: 'Настройки',
                            ),
                          ],
                        ),
                        body: *//*screensList[_selectedScreen.value]*//*MainScreen());
                  },
                ),*/
              ),
        ),
      ),
    );
  }
