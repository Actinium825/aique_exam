import 'package:flutter/material.dart';

const scaffoldBackgroundColor = Color(0xff0e0e0e);
const homePageMargin = EdgeInsets.symmetric(horizontal: 8.0);
const buttonColor = Color(0xff3b3b40);
const qubeGradient = LinearGradient(
  stops: [0.0, 0.5, 1.0],
  colors: [
    Color(0xff50BA84),
    Color(0xff33B3AA),
    Color(0xff15ABD0),
  ],
);

// Home App Bar
const titleGradient = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    Color(0xff50BA84),
    Color(0xff15ABD0),
  ],
);
const profileIconSize = 22.0;
const homeAppBarPadding = EdgeInsets.symmetric(horizontal: 8.0);

// Search Bar
const searchBarHeight = 38.0;
const searchBarRadius = 1000.0;
const searchIconSize = 18.0;

// Qube List Page
const tabBarRadius = 100.0;
const tabBarPadding = EdgeInsets.all(2.0);
const tabBarHeight = 44.0;
const tabBarCount = 2;
const qubeCountRadius = 12.0;
const unselectedTabOpacity = 0.7;
const dateIndicatorPadding = EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0);

// Qube Card
const qubeCardPadding = EdgeInsets.all(20.0);
const qubeCardRadius = 44.0;
const qubeCardBackgroundColor = Color(0xff26262B);
const qubeCardButtonPadding = EdgeInsets.symmetric(vertical: 8.0);
const qubeCardButtonRadius = 100.0;
const qubeCardArrowSize = 16.0;
