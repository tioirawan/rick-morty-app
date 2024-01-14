import 'package:flutter/material.dart';

import 'ui/route/routes.dart';
import 'ui/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: appTheme,
      onGenerateRoute: generateRoute,
    );
  }
}
