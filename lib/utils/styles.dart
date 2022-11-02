import 'package:flutter/material.dart';

abstract class CustomTextStyle {
  static const TextStyle header = TextStyle(
      color: Colors.black,
      fontSize: 24,
      fontWeight: FontWeight.bold);

  static const TextStyle subheader = TextStyle(
      color: Colors.black,
      fontSize: 16,
      fontWeight: FontWeight.normal);

  static const TextStyle subheadergrey = TextStyle(
      color: Colors.grey,
      fontSize: 16,
      fontWeight: FontWeight.normal);
}