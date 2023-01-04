import 'dart:ui';

import 'package:flutter/material.dart';

class Utils {
  static const bool initialDarkTheme = false;

  static const String initialColorTheme = "blue";

  static const String initialUserName = "initialUserName";

  static const List<String> initialCategoryList = ["Home", "Car", "Personal"];

  static const List<String> initialTypeList = [
    "Anniversary",
    "Assurance",
    "Credit",
    "Electricity",
    "Gas",
    "Health",
    "Internet",
    "Maintenance",
    "Mortgage",
    "Phone",
    "Rent",
    "Tax",
    "TV",
    "Utilities",
  ];

  static Color getSelectedColor(String pColorTheme) {
    switch (pColorTheme) {
      case "red":
        {
          return Colors.pink;
        }
      case "green":
        {
          return Colors.teal;
        }
      case "blue":
        {
          return Colors.indigo;
        }
      default:
        {
          return Colors.indigo;
        }
    }
  }

  static Color getUnSelectedColor(String pColorTheme) {
    switch (pColorTheme) {
      case "red":
        {
          return Colors.red;
        }
      case "green":
        {
          return Colors.green;
        }
      case "blue":
        {
          return Colors.blue;
        }
      default:
        {
          return Colors.blue;
        }
    }
  }
}
