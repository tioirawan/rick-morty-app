import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common/debouncer.dart';
import '../../providers/characters/characters_provider.dart';
import '../../widgets/character/characters_list.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _searchController = TextEditingController();

  final Debouncer _debouncer = Debouncer(milliseconds: 500);

  bool _isSearching = false;
  bool _searchTextIsEmpty = true;

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
          controller: _scrollController,
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
                          if (_isSearching) {
                            _clearSearch();
                          }
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
              child: _buildSearchField(theme),
            ),
            CharactersList(
              scrollController: _scrollController,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchField(ThemeData theme) {
    return AnimatedOpacity(
      duration: 0.25.seconds,
      opacity: _isSearching ? 1 : 0,
      curve: Curves.easeInOut,
      child: AnimatedContainer(
        duration: 0.25.seconds,
        curve: Curves.easeInOut,
        height: _isSearching ? 56 : 0,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        margin: const EdgeInsets.only(top: 16),
        child: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            hintText: 'Search',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            filled: true,
            fillColor: theme.cardColor,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            prefixIcon: const Icon(Icons.search),
            suffixIcon: _searchTextIsEmpty
                ? null
                : IconButton(
                    onPressed: _clearSearch,
                    icon: const Icon(Icons.close),
                  ),
          ),
          onChanged: (value) {
            _debouncer.run(
              () =>
                  ref.read(charactersProvider.notifier).searchCharacters(value),
            );

            setState(() {
              _searchTextIsEmpty = value.isEmpty;
            });
          },
        ),
      ),
    );
  }

  void _clearSearch() {
    setState(() {
      _searchTextIsEmpty = true;
    });
    _searchController.clear();
    ref.read(charactersProvider.notifier).searchCharacters(null);
  }
}
