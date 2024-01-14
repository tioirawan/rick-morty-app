import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../common/enums.dart';
import '../../../domain/models/character_model.dart';

class CharacterGender extends ConsumerWidget {
  const CharacterGender({
    super.key,
    required this.character,
  });

  final CharacterModel character;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        FaIcon(
          switch (character.gender) {
            Gender.male => FontAwesomeIcons.venus,
            Gender.female => FontAwesomeIcons.mars,
            Gender.genderless => FontAwesomeIcons.venusMars,
            _ => FontAwesomeIcons.question,
          },
          size: 12,
          color: switch (character.gender) {
            Gender.male => Colors.blue.shade200,
            Gender.female => Colors.red.shade200,
            Gender.genderless => Colors.purple.shade200,
            _ => Colors.grey.shade200,
          },
        ),
        const SizedBox(width: 4),
        Text(
          switch (character.gender) {
            Gender.male => 'Male',
            Gender.female => 'Female',
            Gender.genderless => 'Genderless',
            _ => 'Unknown'
          },
          style: theme.textTheme.bodyMedium,
        ),
      ],
    );
  }
}
