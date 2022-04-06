import 'package:flutter/material.dart';
import 'package:groceries_app/constants/constants.dart';

Widget tabLayout(String text) {
  return Container(
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: greenColor,
      borderRadius: BorderRadius.circular(borderRadius),
    ),
    child: Text(text),
  );
}
