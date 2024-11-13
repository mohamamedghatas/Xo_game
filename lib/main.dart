import 'package:flutter/material.dart';
import 'package:xo_game/player_screen.dart';
import 'package:xo_game/xo_game_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
initialRoute: PlayerScreen.routeName,
      routes: {

        XoGameScreen.routeName:(context) => XoGameScreen(),
        PlayerScreen.routeName:(context) => PlayerScreen(),
      },

    );
  }
}
