import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset('assets/img/dice1.png'),
          Image.asset('assets/img/dice2.png'),
        ],
      ),
    );
    //   body: Image.asset('assets/img/img.png',
    //       width: double.infinity,
    //       height: double.infinity,
    //       fit: BoxFit.cover),
    // );
  }
}
