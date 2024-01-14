import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dominant_color_provider.g.dart';

@Riverpod(keepAlive: true)
Future<Color?> dominantColor(DominantColorRef ref, String? imageUrl) async {
  if (imageUrl == null) {
    return null;
  }

  try {
    final paletteGenerator = await PaletteGenerator.fromImageProvider(
      CachedNetworkImageProvider(imageUrl),
    );
    return paletteGenerator.dominantColor?.color;
  } on Exception catch (_) {
    return null;
  }
}
