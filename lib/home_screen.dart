import 'dart:math';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _score1 = 0;
  int _score2 = 0;
  int _currentScore = 0;
  int _image1 = 1;
  int _image2 = 1;
  bool _isFirstTurn = true;

  @override
  Widget build(BuildContext context) {
    // _score2 = 0;
    // _score1 = 0;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        // leading: IconButton(
        //   onPressed: () {},
        //   icon: Icon(Icons.menu),
        // ),
        title: Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "Qo'chqarbek",
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
              Text(
                _score1.toString(),
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
              Text(
                "vs",
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
              Text(
                _score2.toString(),
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
              Text(
                'Teshavoy',
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          Image.asset(
            'assets/img/img_1.png',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: _isFirstTurn
                        ? () {
                            _isFirstTurn = false;
                            _roll();
                          }
                        : null,
                    child: Text("Click")),
                Image.asset(
                  'assets/img/dice$_image1.png',
                  width: 120,
                  height: 120,
                  fit: BoxFit.cover,
                ),
                Text(
                  _currentScore.toString(),
                  style: TextStyle(color: Colors.white, fontSize: 50),
                ),
                Image.asset(
                  'assets/img/dice$_image2.png',
                  width: 120,
                  height: 120,
                  fit: BoxFit.cover,
                ),
                ElevatedButton(
                    onPressed: !_isFirstTurn
                        ? () {
                            _isFirstTurn = true;
                            _roll();
                          }
                        : null,
                    child: Text("Click")),
              ],
            ),
          )
        ],
      ),
    );
  }

  void _roll() {
    final random = Random();
    _image1 = random.nextInt(6) + 1;
    _image2 = random.nextInt(6) + 1;
    _currentScore = _image1 + _image2;
    if(!_isFirstTurn) {
      _score1 += _currentScore;
    } else {
      _score2 += _currentScore;
    }
    _checkWinner();
    setState(() {});
  }
  void _checkWinner() {
    if(_score1 >= 50 || _score2 >= 50) {
      showDialog(context: context, builder: (context) => AlertDialog(
        title: Text("Congratulations!"),
        content: Text(_score1 > _score2 ? "Qo'shqarbek won" : "Teshavoy won"),
      ));
    }
  }
}
