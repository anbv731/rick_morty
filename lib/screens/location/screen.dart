import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rick_morty/data/person_model.dart';
import 'package:rick_morty/screens/character/screen.dart';
import 'package:rick_morty/theme/color_theme.dart';
import 'package:rick_morty/theme/text_theme.dart';

class LocationCharacters extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ...List.generate(
        6,
        (index) => Padding(
          padding: const EdgeInsets.only(left: 16, bottom: 24, right: 16),
          child: GestureDetector(
            onTap: () {},
            child: Row(
              children: [
                SizedBox(
                  width: 74,
                  height: 74,
                  child: ClipOval(
                    child: Image.asset(
                      'assets/images/morty.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 18,
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text('ЖИВОЙ', style: ThemeText.green),
                      Text(
                        'Морти Смитт',
                        style: ThemeText.name,
                      ),
                      Text('Человек , Мужской',
                          style: ThemeText.fieldDescription),
                    ],
                    crossAxisAlignment: CrossAxisAlignment.start,
                  ),
                ),
                SvgPicture.asset('assets/svg_icons/vector.svg'),
              ],

            ),
          ),
        ),
      ),
    ]);
  }
}

class Location extends StatelessWidget {
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
                      Image.asset('assets/images/earth1.png',
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
                                'Мир \u00B7 Измерение С-137',
                                style: ThemeText.fieldDescription,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 32),
                              child: Text(
                                'Это планета, на которой проживает человеческая раса, и главное место для персонажей Рика и Морти. Возраст этой Земли более 4,6 миллиардов лет, и она является четвертой планетой от своей звезды.',
                                style: ThemeText.description,
                                textAlign: TextAlign.left,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 36,bottom: 24 ),
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
                        'Земля С-137',
                        style: ThemeText.locatinName,
                      ),
                    ),
                  ),
                ],
              ),
              LocationCharacters(),
            ],
          ),
        ));
  }
}
