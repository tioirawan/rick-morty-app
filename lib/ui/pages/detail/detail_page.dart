import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../domain/models/character_model.dart';
import '../../providers/characters/favorite_characters_provider.dart';
import '../../providers/common/dominant_color_provider.dart';
import '../../providers/common/foreground_color_provider.dart';
import '../../widgets/character/character_gender.dart';
import '../../widgets/character/character_image_placeholder.dart';
import '../../widgets/character/character_species.dart';
import '../../widgets/character/character_status.dart';

class DetailPage extends ConsumerWidget {
  const DetailPage({
    super.key,
    required this.character,
    this.imageHeroTag,
  });

  final String? imageHeroTag;
  final CharacterModel character;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;

    final dominantColor =
        ref.watch(dominantColorProvider(character.image)).value ??
            Colors.grey.shade200;
    final foregroundColor = ref.watch(foregroundColorProvider(dominantColor));

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              // gradient of image
              child: ShaderMask(
                shaderCallback: (rect) {
                  return LinearGradient(
                    colors: [
                      Colors.black.withOpacity(0.25),
                      Colors.transparent,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: const [0, 0.9],
                  ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
                },
                blendMode: BlendMode.dstIn,
                child: ImageFiltered(
                  imageFilter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                  child: CachedNetworkImage(
                    imageUrl: character.image ?? '',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Column(
              children: [
                SizedBox(height: MediaQuery.of(context).padding.top),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const FaIcon(Icons.arrow_back_ios_new),
                    ),
                    IconButton(
                      onPressed: () {
                        ref
                            .read(favoriteCharactersProvider.notifier)
                            .toggleFavorite(character);
                      },
                      icon: Consumer(
                        builder: (context, ref, child) {
                          final isFavorited = ref
                              .watch(isCharacterFavoritedProvider(character));

                          if (isFavorited) {
                            return FaIcon(
                              Icons.favorite,
                              color: Colors.red.shade400,
                            );
                          }
                          return const FaIcon(Icons.favorite_border);
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                if (imageHeroTag != null)
                  Hero(
                    tag: imageHeroTag!,
                    child: _buildImage(),
                  )
                else
                  _buildImage(),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Center(
                    child: Text(
                      character.name ?? '',
                      style: textTheme.displayMedium?.copyWith(
                        color: dominantColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  runSpacing: 2,
                  alignment: WrapAlignment.center,
                  runAlignment: WrapAlignment.center,
                  children: [
                    CharacterSpecies(character: character),
                    CharacterGender(character: character),
                    CharacterStatus(character: character)
                  ],
                ),
                const SizedBox(height: 32),
                Divider(
                  color: dominantColor,
                  thickness: 1,
                  indent: width * 0.25,
                  endIndent: width * 0.25,
                ),
                const SizedBox(height: 32),
                Container(
                  padding: const EdgeInsets.all(16),
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: dominantColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                FaIcon(
                                  FontAwesomeIcons.locationCrosshairs,
                                  size: 12,
                                  color: foregroundColor,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  'Last known location:',
                                  style: textTheme.bodyMedium!.copyWith(
                                    color: foregroundColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Text(
                              character.location?.name ?? '',
                              style: textTheme.bodyMedium?.copyWith(
                                color: foregroundColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                FaIcon(
                                  FontAwesomeIcons.earthAsia,
                                  size: 12,
                                  color: foregroundColor,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  'Origin:',
                                  style: textTheme.bodyMedium!.copyWith(
                                    color: foregroundColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Text(
                              character.origin?.name ?? '',
                              style: textTheme.bodyMedium?.copyWith(
                                color: foregroundColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: character.image == null || character.image!.isEmpty
          ? const CharacterImagePlaceholder()
          : CachedNetworkImage(
              imageUrl: character.image ?? '',
              placeholder: (context, url) => const CharacterImagePlaceholder(),
              width: 128,
              height: 128,
            ),
    );
  }
}
