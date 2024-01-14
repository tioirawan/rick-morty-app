import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';

import '../../providers/characters/favorite_characters_provider.dart';
import '../../widgets/character/character_card.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
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
            _buildList(),
          ],
        ),
      ),
    );
  }

  Widget _buildList() {
    return Consumer(
      builder: (context, ref, child) {
        final state = ref.watch(favoriteCharactersProvider);

        return state.when(
          loading: () => SliverFillRemaining(
            hasScrollBody: false,
            child: _buildLoading(context),
          ),
          error: (error, stackTrace) =>
              _buildEmptyList(context, error.toString()),
          data: (characters) {
            if (characters.isEmpty) {
              return _buildEmptyList(
                context,
                'You have no favorite characters, duh!',
              );
            }

            return SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => CharacterCard(
                  character: characters[index],
                  imageHeroTag: 'favorite_character_card_$index',
                  onPressed: () {
                    Navigator.pushNamed(context, '/detail', arguments: {
                      'character': characters[index],
                      'imageHeroTag': 'favorite_character_card_$index',
                    });
                  },
                ),
                childCount: characters.length,
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildLoading(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.25),
        child: Lottie.asset(
          'assets/lottie/loading.json',
        ),
      ),
    );
  }

  Widget _buildEmptyList(
    BuildContext context, [
    String message = 'Shooting in the emptyness...',
  ]) {
    return SliverFillRemaining(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              'assets/lottie/empty.json',
              height: 200,
            ),
            const SizedBox(height: 16),
            Text(
              message,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ),
      ),
    );
  }
}
