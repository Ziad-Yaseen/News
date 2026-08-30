import 'package:flutter/material.dart';

class ArticleData extends StatelessWidget {
  const ArticleData({
    super.key,
    required this.title,
    required this.author,
    required this.date,
    required this.content,
  });

  final String title;
  final String author;
  final String date;
  final String content;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              '$author · $date',
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            Text(content, style: const TextStyle(fontSize: 16, height: 1.6)),
          ],
        ),
      ),
    );
  }
}
