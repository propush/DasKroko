import 'package:das_kroko/card/screens/word_card_screen.dart';
import 'package:das_kroko/difficulty/screens/choose_level_screen.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@singleton
class AppRouter {
  Route generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case ChooseLevelScreen.routeName:
        return MaterialPageRoute(builder: (_) => ChooseLevelScreen());
      case WordCardScreen.routeName:
        var wordCardScreenArguments =
            routeSettings.arguments as WordCardScreenArguments;
        return MaterialPageRoute(
          builder: (_) {
            return WordCardScreen(
              difficultyLevel: wordCardScreenArguments.difficultyLevel,
            );
          },
        );
      default:
        return MaterialPageRoute(builder: (_) => errorScreen());
    }
  }

  Widget errorScreen() => Scaffold(
        appBar: AppBar(
          title: const Text("Error"),
        ),
        body: const Center(
          child: Text("Error routing"),
        ),
      );
}
