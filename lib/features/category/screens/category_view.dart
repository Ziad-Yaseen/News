import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news/features/home/widgets/news_list_view_builder.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key, required this.category, required this.title});

  final String category;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        leading: BackButton(onPressed: () => context.pop()),
      ),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [NewsListViewBuilder(category: category)],
      ),
    );
  }
}
