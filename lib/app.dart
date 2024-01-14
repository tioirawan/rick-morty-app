import 'package:flutter/material.dart';

import 'ui/pages/detail/detail_page.dart';
import 'ui/pages/home/home_page.dart';
import 'ui/pages/search/search_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const HomePage(),
        '/search': (context) => const SearchPage(),
        '/detail': (context) => const DetailPage(),
      },
    );
  }
}
