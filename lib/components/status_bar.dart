import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void setStatusBarStyle(Color color, Brightness brightness) {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: color,
    statusBarBrightness: brightness,
    statusBarIconBrightness: brightness,
  ));
}