import 'package:flutter/material.dart';
import 'package:groceries_app/constants/constants.dart';

Widget customButton(String text, VoidCallback? onPress) {
  return ElevatedButton(
    onPressed: onPress,
    child: Text(text),
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(greenColor),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0))),
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
    ),
  );
}
