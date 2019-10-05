import 'package:flutter/material.dart';


final baseTextStyle = const TextStyle(fontFamily: 'Merriweather');
final drawerTextStyle = const TextStyle(fontFamily: 'OpenSans');

final headerTextStyle = baseTextStyle.copyWith(
  color: const Color.fromRGBO(50, 50, 50, 1),
  fontSize: 16.0,
  fontWeight: FontWeight.w500,
);

final regularTextStyle = baseTextStyle.copyWith(
    color: const Color.fromRGBO(150, 150, 150, 1),
    fontSize: 10.0,
    fontWeight: FontWeight.w400);

final subHeaderTextStyle = regularTextStyle.copyWith(fontSize: 12.0);

final priceTextStyle = baseTextStyle.copyWith(
  color: const Color.fromRGBO(10, 10, 10, 1),
  fontSize: 18.0,
  fontWeight: FontWeight.w500,
);

final drawerHeaderStyle = drawerTextStyle.copyWith(
  color: const Color.fromRGBO(255, 255, 255, 1),
  fontSize: 16.0,
  fontWeight: FontWeight.w800,
);
final drawerEmailStyle = drawerTextStyle.copyWith(
  color: const Color.fromRGBO(255, 255, 255, 1),
  fontSize: 16.0,
  fontWeight: FontWeight.w400,
);
final drawerRegularStyle = drawerTextStyle.copyWith(
  fontSize: 16.0,
);