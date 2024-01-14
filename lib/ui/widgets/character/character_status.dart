import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../common/enums.dart';
import '../../../domain/models/character_model.dart';

class CharacterStatus extends ConsumerWidget {
  const CharacterStatus({
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
          switch (character.status) {
            Status.alive => FontAwesomeIcons.heartPulse,
            Status.dead => FontAwesomeIcons.skullCrossbones,
            _ => FontAwesomeIcons.question,
          },
          size: 12,
          color: switch (character.status) {
            Status.alive => Colors.green.shade200,
            Status.dead => Colors.red.shade200,
            _ => Colors.grey.shade200,
          },
        ),
        const SizedBox(width: 4),
        Text(
          switch (character.status) {
            Status.alive => 'Alive',
            Status.dead => 'Dead',
            _ => 'Unknown'
          },
          style: theme.textTheme.bodyMedium,
        ),
      ],
    );
  }
}
