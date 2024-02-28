import 'package:flutter/material.dart';

import 'home_screen.dart';

void main() {
  runApp(const DiceGame());
}
class DiceGame extends StatelessWidget {
  const DiceGame({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
