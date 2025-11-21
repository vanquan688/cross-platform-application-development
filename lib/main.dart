import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Center(child: Text('Magic 8 Ball')),
          backgroundColor: Colors.white,
        ),
        body: const MagicBall(),
      ),
    );
  }
}

class MagicBall extends StatefulWidget {
  const MagicBall({super.key});

  @override
  State<MagicBall> createState() => _MagicBallState();
}

class _MagicBallState extends State<MagicBall> {
  String answer = 'THE ANSWER IS YES';
  final List<String> answers = [
    'YES',
    'NO',
    'ASK AGAIN LATER',
    'THE ANSWER IS YES',
    'I HAVE NO IDEA',
  ];

  void getAnswer() {
    setState(() {
      answer = answers[Random().nextInt(answers.length)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () {
          getAnswer();
        },
        child: Stack(
          children: <Widget>[
            Image.asset('assets/images/images.jpg'),
            Positioned(
              top: 95,
              left: 90,
              child: Container(
                width: 50,
                  child: Text(
                    answer,
                    style: TextStyle(color: Colors.white, fontSize: 8),
                    textAlign: TextAlign.center,
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
