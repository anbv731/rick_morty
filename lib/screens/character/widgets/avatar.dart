import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:rick_morty/data/persons_loader.dart';

class Avatar extends StatelessWidget {
  Avatar(this.person);

  Person person = Person();

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
                  image: NetworkImage(person.image),
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
                backgroundColor: Colors.black,
                child: ClipOval(
                  child: Image.network(
                    person.image,
                    width: 146,
                    height: 146,
                    fit: BoxFit.fill,
                  ),
                )),
          ),
          Positioned(
            left: 24,
            top: 54,
            child: FloatingActionButton(
              backgroundColor: Colors.black,
              elevation: 1,
              onPressed: () => {Navigator.pop(context)},
              child: Icon(Icons.arrow_back_sharp),
            ),
          ),
        ],
      ),
    );
  }
}
