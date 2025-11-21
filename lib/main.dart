import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Center(child: const Text('I Am Rich')),
          backgroundColor: Colors.deepOrange,
        ),
        body: const Image(
          image: AssetImage('assets/images/diamond.webp'),
          fit: BoxFit.contain,
          height: double.infinity,
          width: double.infinity,
          alignment: Alignment.center,
        ),
      ),
    ),
  );
}
