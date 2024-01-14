import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../domain/models/character_model.dart';
import '../../providers/common/dominant_color_provider.dart';

class CharacterSpecies extends ConsumerWidget {
  const CharacterSpecies({
    super.key,
    required this.character,
  });

  final CharacterModel character;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final dominantColor =
        ref.watch(dominantColorProvider(character.image)).value ??
            Colors.grey.shade200;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        FaIcon(
          FontAwesomeIcons.skullCrossbones,
          size: 12,
          color: dominantColor,
        ),
        const SizedBox(width: 4),
        Text(
          '${character.species}${character.type?.isNotEmpty ?? false ? ' (${character.type})' : ''}',
          style: theme.textTheme.bodyMedium,
        ),
      ],
    );
  }
}
