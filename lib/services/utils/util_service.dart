import 'dart:math';

import 'package:flutter/material.dart';

class UtilService {
  static final UtilService _instance = UtilService._init();

  static UtilService prefs;

  factory UtilService() {
    return _instance;
  }

  UtilService._init() {}

  bool isLearnByDate(int startTS) {
    List<int> learnPlans = [0, 1, 2, 4, 7, 11, 15, 25, 30];
    int intervalDays =
        ((DateTime.now().millisecondsSinceEpoch - startTS) / (3600 * 24 * 1000))
            .floor();
    return learnPlans.where((item) => item == intervalDays).toList().length > 0;
  }

  getRandomColor() {
    return Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
  }
}
