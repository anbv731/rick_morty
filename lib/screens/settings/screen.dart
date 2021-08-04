import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:rick_morty/screens/settings/widgets/dialog_screen.dart';
import 'package:rick_morty/theme/color_theme.dart';
import 'package:rick_morty/theme/text_theme.dart';
import 'package:rick_morty/theme/theme_manager.dart';
import 'package:rick_morty/theme/theme_types.dart';

class ScreenSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 57),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 53),
              child: Text('Настройки', style: Theme.of(context).textTheme.headline6),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 24.0),
              child: Text('ВНЕШНИЙ ВИД', style: Theme.of(context).textTheme.overline),
            ),
            ElevatedButton(
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Theme.of(context).primaryColor),),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: SvgPicture.asset('assets/svg_icons/theme.svg'),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Темная тема',
                          style: Theme.of(context).textTheme.headline3,
                        ),
                        Text(
                            themeName(
                              Provider.of<ThemeNotifier>(context).getThemeType(),
                            ),
                          style: Theme.of(context).textTheme.headline1,
                        ),
                      ],
                    ),
                  ),
                  SvgPicture.asset('assets/svg_icons/vector.svg')
                ],
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return DialogScreen();
                  },
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 36),
              child: Divider(
                color: Theme.of(context).dividerColor,
              ),
            ),
            Text(
              'О ПРИЛОЖЕНИИ',
              style: Theme.of(context).textTheme.overline,
            ),
            Text(
              'Зигерионцы помещают Джерри и Рика в симуляцию, чтобы узнать секрет изготовления концен-трирован- ной темной материи.',
              style: Theme.of(context).textTheme.bodyText2,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 36),
              child: Divider(
                color: Theme.of(context).dividerColor,
              ),
            ),
            Text('ВЕРСИЯ ПРИЛОЖЕНИЯ', style:Theme.of(context).textTheme.overline),
            Padding(
              padding: const EdgeInsets.only(top: 24),
              child: Text(
                'Rick & Morty v1.0.0',
                style: Theme.of(context).textTheme.bodyText2,
              ),
            )
          ],
        ),
      ),
    );
  }
}
