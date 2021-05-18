import 'dart:ui';

import 'package:flutter/material.dart';

class Character extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
CircleAvatar(child: Image.asset('assets/images/rik.png',    fit: BoxFit.contain,))
        ],
      ),
    );
  }
}
