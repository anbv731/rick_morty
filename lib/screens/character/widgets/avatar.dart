import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rick_morty/data/person_model.dart';
import 'package:rick_morty/theme/color_theme.dart';

class Avatar extends StatelessWidget {
  Avatar(this.person);

  Person person;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 4 + 80,
      child: Stack(
        children: <Widget>[
          ClipRect(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 4,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(person.imageName),
                  fit: BoxFit.cover,
                ),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Container(
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: MediaQuery.of(context).size.height / 4 - 80,
            child: CircleAvatar(
                radius: 80,
                backgroundColor: Theme.of(context).primaryColor,
                child: ClipOval(
                  child: Image.network(
                    person.imageName,
                    width: 146,
                    height: 146,
                    fit: BoxFit.cover,
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
