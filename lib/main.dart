import 'package:ciphers/screens/vigenere_cipher.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new Vigenere(),
      debugShowCheckedModeBanner: false,
    );
  }
}
