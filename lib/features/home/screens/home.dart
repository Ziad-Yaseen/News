import 'package:flutter/material.dart';
import 'package:news/core/constants/app_assets.dart';
import 'package:news/features/home/widgets/app_bar_title.dart';
import 'package:news/features/home/widgets/category_card.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const AppBarTitle(), centerTitle: true),
      body: Column(
        children: [CategoryCard(asset: AppAssets.business, text: 'Business')],
      ),
    );
  }
}
