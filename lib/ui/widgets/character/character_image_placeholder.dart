import 'package:flutter/material.dart';

class CharacterImagePlaceholder extends StatelessWidget {
  const CharacterImagePlaceholder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/character_image_placeholder.jpg',
      width: 128,
      height: 128,
    );
  }
}
