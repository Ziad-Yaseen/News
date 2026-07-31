import 'package:flutter/material.dart';
import 'package:news/features/home/screens/home.dart';

class News extends StatelessWidget {
  const News({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Home());
  }
}
