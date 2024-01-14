import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../providers/common/dominant_color_provider.dart';
import '../../providers/common/foreground_color_provider.dart';

// used to show this
//  "name": "Rick Sanchez",
// "status": "Alive",
// "species": "Human",
// "type": "",
// "gender": "Male",
// "origin": {
//   "name": "Earth",
//   "url": "https://rickandmortyapi.com/api/location/1"
// },
// "location": {
//   "name": "Earth",
//   "url": "https://rickandmortyapi.com/api/location/20"
// },
// "image": "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
// "episode": [
//   "https://rickandmortyapi.com/api/episode/1",
//   "https://rickandmortyapi.com/api/episode/2",
//   // ...
// ],
// "url": "https://rickandmortyapi.com/api/character/1",
// "created": "2017-11-04T18:48:46.250Z"
class CharacterCard extends ConsumerStatefulWidget {
  const CharacterCard({super.key});

  @override
  ConsumerState<CharacterCard> createState() => _CharacterCardState();
}

class _CharacterCardState extends ConsumerState<CharacterCard> {
  final _imageUrl = 'https://rickandmortyapi.com/api/character/avatar/15.jpeg';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final dominantColor = ref.watch(dominantColorProvider(_imageUrl)).value ??
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
        height: 128,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              top: -16,
              left: -16,
              width: 128,
              height: 128,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CachedNetworkImage(
                  imageUrl: _imageUrl,
                ),
              ),
            ),
            Positioned.fill(
              top: 12,
              left: 128,
              bottom: 8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Rick Sanchez',
                    style: theme.textTheme.titleLarge,
                  ),
                  const SizedBox(height: 4),
                  Wrap(
                    spacing: 8,
                    runSpacing: 2,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          FaIcon(
                            FontAwesomeIcons.skullCrossbones,
                            size: 12,
                            color: dominantColor,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            'Human (subtype)',
                            style: theme.textTheme.bodyMedium,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          FaIcon(
                            switch ('male') {
                              'male' => FontAwesomeIcons.venus,
                              'female' => FontAwesomeIcons.mars,
                              'genderless' => FontAwesomeIcons.venusMars,
                              _ => FontAwesomeIcons.question,
                            },
                            size: 12,
                            color: switch ('male') {
                              'male' => Colors.blue.shade200,
                              'female' => Colors.red.shade200,
                              'genderless' => Colors.purple.shade200,
                              _ => Colors.grey.shade200,
                            },
                          ),
                          const SizedBox(width: 4),
                          Text(
                            'Male',
                            style: theme.textTheme.bodyMedium,
                          ),
                        ],
                      ),
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
    );
  }
}
