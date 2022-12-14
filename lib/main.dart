import 'package:flutter/material.dart';
import 'package:resep_makanan/screen/resepmakanan_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RESEP MAKANAN',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const ResepMakananScreen(),
    );
  }
}