import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news/features/home/widgets/app_bar_title.dart';
import 'package:news/features/home/widgets/news_list_view_builder.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppBarTitle(),
        centerTitle: true,
        leading: BackButton(
          onPressed: () => context.pop(),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          NewsListViewBuilder()
        ],
      ),
    );
  }
}