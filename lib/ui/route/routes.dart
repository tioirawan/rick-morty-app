import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../domain/models/character_model.dart';
import '../pages/detail/detail_page.dart';
import '../pages/favorites/favorites_page.dart';
import '../pages/home/home_page.dart';
import '../pages/search/search_page.dart';
import '../pages/splash/splash_page.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(
        builder: (context) => const SplashPage(),
      );
    case '/home':
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const HomePage(),
        transitionDuration: 1.5.seconds,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      );
    case '/search':
      return MaterialPageRoute(
        builder: (context) => const SearchPage(),
      );
    case '/detail':
      final arguments = settings.arguments as Map<String, dynamic>;

      final character = arguments['character'] as CharacterModel;
      final imageHeroTag = arguments['imageHeroTag'] as String?;

      return MaterialPageRoute(
        builder: (context) => DetailPage(
          character: character,
          imageHeroTag: imageHeroTag,
        ),
      );
    case '/favorites':
      return MaterialPageRoute(
        builder: (context) => const FavoritesPage(),
      );
    default:
      return MaterialPageRoute(
        builder: (context) => const SplashPage(),
      );
  }
}
