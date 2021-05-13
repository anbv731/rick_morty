import 'package:flutter/material.dart';
import 'package:rick_morty/theme/color_theme.dart';

class StartScreen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.background,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height:  MediaQuery.of(context).size.height,
        child: Stack(
            children: <Widget>[
              Positioned.fill(child: Image.asset('assets/images/image1.png', fit: BoxFit.cover)),
              Positioned.fromRect(rect: Rect.fromLTRB(), width: Offset(MediaQuery.of(context).size.width, height: MediaQuery.of(context).size.height / 2),
                  child: Image.asset('assets/images/Group 2.png',
                      fit: BoxFit.contain), /*Image.asset('assets/images/textRick.png',
                      fit: BoxFit.fill),*/),
              /*Positioned(left: 165,
                top: 246,
                child: Image.asset('assets/images/textAnd.png',
                    fit: BoxFit.fill),),*/

              Positioned(left: 32,
                top: 431,
                child: Image.asset('assets/images/start1.png',
                    fit: BoxFit.fill),),
              Positioned(left: 46,
                top: 594,
                child: Image.asset('assets/images/start2.png',
                    fit: BoxFit.contain),),
            ],
          ),
      ),
     );
  }
}
