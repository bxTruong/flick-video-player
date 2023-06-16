import 'package:flutter/material.dart';

class OptionModel {
  IconData icon;
  String name;
  Function() onPressFeature;

  OptionModel(
      {required this.icon,
      required this.name,
      required this.onPressFeature});
}
