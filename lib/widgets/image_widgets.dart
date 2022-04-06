import 'package:flutter/material.dart';

Widget imageProfile({double? radius, required String img}) {
  return CircleAvatar(
    backgroundImage: NetworkImage(
      img,
    ),
    radius: radius,
  );
}
