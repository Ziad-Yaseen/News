import 'package:flutter/material.dart';
import 'package:news/core/constants/app_assets.dart';
import 'package:news/core/models/category_model.dart';
import 'package:news/features/home/widgets/category_card.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<CategoryModel> categories = [
      CategoryModel(
        categoryImage: AppAssets.business,
        categoryName: 'Business',
        categoryID: 'business',
      ),
      CategoryModel(
        categoryImage: AppAssets.entertainment,
        categoryName: 'Entertainment',
        categoryID: 'entertainment',
      ),
      CategoryModel(
        categoryImage: AppAssets.general,
        categoryName: 'General',
        categoryID: 'general',
      ),
      CategoryModel(
        categoryImage: AppAssets.health,
        categoryName: 'Health',
        categoryID: 'health',
      ),
      CategoryModel(
        categoryImage: AppAssets.science,
        categoryName: 'Science',
        categoryID: 'science',
      ),
      CategoryModel(
        categoryImage: AppAssets.sports,
        categoryName: 'Sports',
        categoryID: 'sports',
      ),
      CategoryModel(
        categoryImage: AppAssets.technology,
        categoryName: 'Technology',
        categoryID: 'technology',
      ),
    ];
    return SizedBox(
      height: 85,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 8),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return CategoryCard(category: categories[index]);
        },
        separatorBuilder: (context, index) => const SizedBox(width: 8),
      ),
    );
  }
}
