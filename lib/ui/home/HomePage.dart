import 'package:flutter/material.dart';
import 'package:flutter_planets_app/widget/GradientAppBar.dart';
import 'package:flutter_planets_app/ui/home/HomePageBody.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Column(
        children: <Widget>[
          new GradientAppBar("Milkyway"),
          new HomePageBody(),
        ],
      )
    );
  }
}
