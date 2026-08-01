import 'package:flutter/material.dart';
import 'package:news/core/models/category_model.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key,required this.category});
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      height: 85,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(category.categoryImage), fit: BoxFit.cover),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        category.categoryName,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
