import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../domain/models/character_model.dart';
import '../../widgets/character/character_card.dart';

class FavoritesPage extends ConsumerWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg_blur.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 16,
                  ) +
                  EdgeInsets.only(
                    top: MediaQuery.of(context).padding.top,
                  ),
              sliver: SliverToBoxAdapter(
                child: Stack(
                  children: [
                    Positioned.fill(
                      top: 12,
                      child: Hero(
                        tag: 'app_title',
                        child: Text(
                          'Favorites',
                          style: theme.textTheme.displaySmall!,
                          textAlign: TextAlign.center,
                        ).animate().shake(hz: 4, duration: 0.5.seconds),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const FaIcon(FontAwesomeIcons.chevronLeft),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: 16),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => CharacterCard(
                  character: mockCharacter,
                  imageHeroTag: 'favorite_character_card_$index',
                  onPressed: () {
                    Navigator.pushNamed(context, '/detail', arguments: {
                      'character': mockCharacter,
                      'imageHeroTag': 'favorite_character_card_$index',
                    });
                  },
                ),
                childCount: 3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
