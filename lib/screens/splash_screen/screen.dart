import 'package:flutter/material.dart';
import 'package:rick_morty/screens/characters/screen.dart';

import 'package:rick_morty/theme/color_theme.dart';

class StartScreen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ScreenCharacters()));
      },
      child: Scaffold(
        backgroundColor: ThemeColors.background,
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: <Widget>[
              Positioned.fill(
                child:
                    Image.asset('assets/images/image1.png', fit: BoxFit.cover),
              ),
              Align(
                alignment: Alignment.topCenter,
                child:
                    Image.asset('assets/images/Group 2.png', fit: BoxFit.fill),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2,
                  child: Stack(
                    children: <Widget>[
                      Image.asset('assets/images/start1.png', fit: BoxFit.fill),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Image.asset('assets/images/start2.png',
                            fit: BoxFit.contain),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
