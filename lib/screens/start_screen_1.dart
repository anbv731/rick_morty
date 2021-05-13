import 'package:flutter/material.dart';
import 'package:rick_morty/theme/color_theme.dart';

class StartScreen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.background,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: <Widget>[
            Positioned.fill(
                child:
                    Image.asset('assets/images/image1.png', fit: BoxFit.cover)),
            // Positioned.fromRect(rect: Rect.fromCenter(center: Offset(MediaQuery.of(context).size.width / 2, MediaQuery.of(context).size.height / 2), width: 200, height: 600),
            //     child: Container(color: Colors.red) /*Image.asset('assets/images/textRick.png',
            //         fit: BoxFit.fill),*/),
            /*Positioned(left: 165,
                top: 246,
                child: Image.asset('assets/images/textAnd.png',
                    fit: BoxFit.fill),),*/
            Align(
              alignment: Alignment.topCenter,
              child: Image.asset('assets/images/Group 2.png', fit: BoxFit.fill),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox( width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height/2,
                child: Stack(
                  children: <Widget>[
                    Image.asset('assets/images/start1.png', fit: BoxFit.fill),
                    Align(alignment:Alignment.bottomCenter,child: Image.asset('assets/images/start2.png', fit: BoxFit.contain)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
