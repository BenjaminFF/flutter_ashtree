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

  mixStr(String str) {
    str = str.trim();
    while (true) {
      int mixTime = str.length;
      List<String> mixedChars = str.split("");
      while (mixTime > 0) {
        String randomChar =
            String.fromCharCode((Random().nextDouble() * 26).toInt() + 97);
        int randomPos = (Random().nextDouble() * str.length).toInt();
        mixedChars[randomPos] = randomChar;
        mixTime--;
      }
      if (mixedChars.join("") != str) return mixedChars.join("");
    }
  }

  splitStr(String str, int maxSplitNum) {
    str = str.trim();
    int strLen = str.length,
        minSubStrLen = strLen <= 6 ? 1 : (strLen < 13 ? 2 : 3);
    while (true) {
      int count = strLen;
      List<String> subStrArr = [];
      while (count > 0) {
        int subStrLen = minSubStrLen + (Random().nextDouble() * 3).toInt();
        if (count < subStrLen) subStrLen = count;
        subStrArr
            .add(str.substring(strLen - count, strLen - count + subStrLen));
        count -= subStrLen;
      }
      if (subStrArr.length < maxSplitNum) return subStrArr;
    }
  }
}
