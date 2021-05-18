import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:rick_morty/data/persons_loader.dart';




class Character extends StatelessWidget {
  Character(this.person);
Person person=Person();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.black,
              height: MediaQuery.of(context).size.height / 4 + 80,
              child: Stack(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 4,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/rik.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                      child: Container(
                        color: Colors.black.withOpacity(0.6),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    top: MediaQuery.of(context).size.height / 4 - 80,
                    child: CircleAvatar(
                        radius: 80,
                        backgroundColor: Colors.black,
                        child: Image.network(
                          person.image,
                          width: 146,
                          height: 146,
                          fit: BoxFit.fill,
                        )),
                  ),
                  Positioned(
                    left: 24,
                    top: 54,
                    child: FloatingActionButton(
                      backgroundColor: Colors.black,
                      elevation: 1,
                      onPressed: () => {},
                      child: Icon(Icons.arrow_back_sharp),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Column(
                children: [
                  Text(
                    'Рик Санчез',
                    style: TextStyle(fontSize: 34, color: Colors.white),
                  ),
                  Text(
                    'живой',
                    style: TextStyle(fontSize: 10, color: Colors.greenAccent),
                  ),
                  Text(
                    'Главный протагонист мультсериала "Рик  и Морти". Безумный ученый,чей алкоголизм, безрассудство и социопатия заставляют беспокоится семью его дочери.',
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.white, fontSize: 13),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
