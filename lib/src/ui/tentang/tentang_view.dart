import 'package:adminkursus/src/helper/Screen.dart';
import 'package:flutter/material.dart';

class Tentang extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tentang'),
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(20),
          width: Screen.width(context),
          height: Screen.heigth(context) - kBottomNavigationBarHeight,
          child: Card(
            child: Center(
              child: Text('About this app !'),
            ),
          ),
        ),
      ),
    );
  }
}
