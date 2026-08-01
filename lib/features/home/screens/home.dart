import 'package:flutter/material.dart';
import 'package:news/features/home/widgets/app_bar_title.dart';
import 'package:news/features/home/widgets/categoriew_list_view.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const AppBarTitle(), centerTitle: true),
      body: const Column(
        children: [
          CategoriesListView()
        ],
      ),
    );
  }
}
