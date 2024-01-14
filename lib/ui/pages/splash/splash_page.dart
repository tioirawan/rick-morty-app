import 'dart:ui';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(2.seconds, () {
        Navigator.pushReplacementNamed(context, '/home');
      });
    });
  }

  @override
  void didChangeDependencies() {
    precacheImage(const AssetImage('assets/images/bg_blur.jpg'), context);
    super.didChangeDependencies();
  }

  Widget _flightShuttleBuilder(
    BuildContext flightContext,
    Animation<double> animation,
    HeroFlightDirection flightDirection,
    BuildContext fromHeroContext,
    BuildContext toHeroContext,
  ) {
    final textTheme = Theme.of(flightContext).textTheme;
    final fromStyle = textTheme.displayLarge!;
    final toStyle = textTheme.displaySmall!;

    return Center(
      child: AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          final fontSize = lerpDouble(
            fromStyle.fontSize,
            toStyle.fontSize,
            animation.value,
          );

          return DefaultTextStyle(
            style: textTheme.displayLarge!.copyWith(
              fontSize: fontSize,
            ),
            child: child!,
          );
        },
        child: const Text('Rick and Morty'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/bg.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.25,
            left: 28,
            right: 28,
            child: Center(
              child: DefaultTextStyle(
                textAlign: TextAlign.end,
                style: Theme.of(context).textTheme.displayLarge!,
                child: Hero(
                  tag: 'app_title',
                  flightShuttleBuilder: _flightShuttleBuilder,
                  child: AnimatedTextKit(
                    totalRepeatCount: 1,
                    animatedTexts: [
                      FlickerAnimatedText(
                        'Rick and Morty',
                        speed: 2500.milliseconds,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
