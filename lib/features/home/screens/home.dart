import 'package:flutter/material.dart';
import 'package:news/features/home/widgets/app_bar_title.dart';
import 'package:news/features/home/widgets/categories_list_view.dart';
import 'package:news/features/home/widgets/news_list_view_builder.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            title: AppBarTitle(),
            centerTitle: true,
            backgroundColor: Colors.white,
            pinned: true,
            floating: true,
            snap: true,

            elevation: 0,
          ),
          SliverToBoxAdapter(child: CategoriesListView()),
          NewsListViewBuilder(),
        ],
      ),
      // body: Column(
      //   children: [
      //     ElevatedButton(
      //       onPressed: () {
      //         NewsService().GetNews();
      //       },
      //       child: Text('data'),
      //     ),
      //   ],
      // ),
    );
  }
}
