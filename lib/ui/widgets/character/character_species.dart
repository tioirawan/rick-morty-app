import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../domain/models/character_model.dart';

class CharacterSpecies extends ConsumerWidget {
  const CharacterSpecies({
    super.key,
    required this.character,
    this.isExpanded = false,
  });

  final CharacterModel character;
  final bool isExpanded;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final text = Text(
      '${character.species}${character.type?.isNotEmpty ?? false ? ' (${character.type})' : ''}',
      style: theme.textTheme.bodyMedium,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        FaIcon(
          FontAwesomeIcons.dna,
          size: 12,
          color: switch (character.species) {
            'Human' => Colors.green.shade200,
            'Alien' => Colors.purple.shade200,
            'Animal' => Colors.orange.shade200,
            'Robot' => Colors.blue.shade200,
            'Mythological Creature' => Colors.red.shade200,
            'Humanoid' => Colors.yellow.shade200,
            _ => Colors.grey.shade200,
          },
        ),
        const SizedBox(width: 4),
        if (isExpanded)
          Expanded(
            child: text,
          )
        else
          text,
      ],
    );
  }
}
