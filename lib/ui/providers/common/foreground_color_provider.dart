import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'foreground_color_provider.g.dart';

@Riverpod(keepAlive: true)
Color foregroundColor(ForegroundColorRef ref, Color bgColor) {
  print('foregroundColor');
  return _fgFromBg(bgColor);
}

Color _fgFromBg(Color bgColor) {
  switch (ThemeData.estimateBrightnessForColor(bgColor)) {
    case Brightness.dark:
      return Colors.white;
    case Brightness.light:
      return Colors.black;
  }
}
