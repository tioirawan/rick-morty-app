import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/models/character_model.dart';
import '../../providers/common/dominant_color_provider.dart';
import '../../providers/common/foreground_color_provider.dart';
import 'character_gender.dart';
import 'character_species.dart';

class CharacterCard extends ConsumerStatefulWidget {
  const CharacterCard({
    required this.character,
    this.imageHeroTag,
    this.onPressed,
    super.key,
  });

  final CharacterModel character;
  final String? imageHeroTag;
  final VoidCallback? onPressed;

  @override
  ConsumerState<CharacterCard> createState() => _CharacterCardState();
}

class _CharacterCardState extends ConsumerState<CharacterCard> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final dominantColor =
        ref.watch(dominantColorProvider(widget.character.image)).value ??
            Colors.grey.shade200;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        decoration: BoxDecoration(
          color: theme.cardColor,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: dominantColor.withOpacity(0.5),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        margin: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 16,
        ),
        height: 138,
        child: Material(
          borderRadius: BorderRadius.circular(8),
          child: InkWell(
            borderRadius: BorderRadius.circular(8),
            onTap: widget.onPressed,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  top: -16,
                  left: -16,
                  child: widget.imageHeroTag != null
                      ? Hero(
                          tag: widget.imageHeroTag!,
                          child: _buildImage(),
                        )
                      : _buildImage(),
                ),
                Positioned.fill(
                  top: 12,
                  left: 128,
                  bottom: 8,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.character.name ?? '',
                        style: theme.textTheme.titleLarge,
                      ),
                      const SizedBox(height: 4),
                      Wrap(
                        spacing: 8,
                        runSpacing: 2,
                        children: [
                          CharacterSpecies(character: widget.character),
                          CharacterGender(character: widget.character),
                        ],
                      ),
                      const Spacer(),
                      FilledButton(
                        onPressed: () {},
                        style: FilledButton.styleFrom(
                          backgroundColor: dominantColor,
                          foregroundColor:
                              ref.watch(foregroundColorProvider(dominantColor)),
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          minimumSize: const Size(0, 32),
                        ),
                        child: const Text('Make my favorite'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ClipRRect _buildImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: CachedNetworkImage(
        imageUrl: widget.character.image ?? '',
        width: 128,
        height: 128,
      ),
    );
  }
}
