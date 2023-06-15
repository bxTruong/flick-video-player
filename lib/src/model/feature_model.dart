import 'package:flutter/material.dart';

enum FeatureType { speed, quality, cancel }

class FeatureModel {
  IconData icon;
  String name;
  FeatureType featureType;
  Function() onPressFeature;

  FeatureModel(
      {required this.icon,
      required this.name,
      required this.featureType,
      required this.onPressFeature});
}
