import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rick_morty/screens/settings/widgets/dialog_screen.dart';
import 'package:rick_morty/theme/color_theme.dart';
import 'package:rick_morty/theme/text_theme.dart';

class ScreenSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.background,
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 57),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 53),
              child: Text('Настройки', style: ThemeText.location),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 24.0),
              child: Text('ВНЕШНИЙ ВИД', style: ThemeText.about),
            ),
            ElevatedButton(
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(ThemeColors.background),),
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
                          style: ThemeText.theme,
                        ),
                        Text(
                          'Включена',
                          style: ThemeText.date,
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
                color: ThemeColors.text2,
              ),
            ),
            Text(
              'О ПРИЛОЖЕНИИ',
              style: ThemeText.about,
            ),
            Text(
              'Зигерионцы помещают Джерри и Рика в симуляцию, чтобы узнать секрет изготовления концен-трирован- ной темной материи.',
              style: ThemeText.description1,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 36),
              child: Divider(
                color: ThemeColors.text2,
              ),
            ),
            Text('ВЕРСИЯ ПРИЛОЖЕНИЯ', style: ThemeText.about),
            Padding(
              padding: const EdgeInsets.only(top: 24),
              child: Text(
                'Rick & Morty v1.0.0',
                style: ThemeText.description1,
              ),
            )
          ],
        ),
      ),
    );
  }
}
