import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/models/character_model.dart';
import '../../widgets/character/character_card.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  bool _isSearching = false;

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
                          'Rick and Morty',
                          style: theme.textTheme.displaySmall!,
                          textAlign: TextAlign.center,
                        ).animate().shake(hz: 4, duration: 0.5.seconds),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/favorites');
                        },
                        icon: const Icon(Icons.favorite_border),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            _isSearching = !_isSearching;
                          });
                        },
                        icon: _isSearching
                            ? const Icon(Icons.close)
                            : const Icon(Icons.search),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: AnimatedOpacity(
                duration: 0.5.seconds,
                opacity: _isSearching ? 1 : 0,
                curve: Curves.easeInOut,
                child: AnimatedContainer(
                  duration: 0.5.seconds,
                  curve: Curves.easeInOut,
                  height: _isSearching ? 56 : 0,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  margin: const EdgeInsets.only(top: 16),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      filled: true,
                      fillColor: theme.cardColor,
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 16),
                      prefixIcon: const Icon(Icons.search),
                    ),
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => CharacterCard(
                  character: mockCharacter,
                  imageHeroTag: 'home_character_card_$index',
                  onPressed: () {
                    Navigator.pushNamed(context, '/detail', arguments: {
                      'character': mockCharacter,
                      'imageHeroTag': 'home_character_card_$index',
                    });
                  },
                ),
                childCount: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
