import 'package:flutter/material.dart';

class ArticleAppBar extends StatelessWidget {
  const ArticleAppBar({
    super.key,
    required this.imageHeight,
    required this.image,
  });

  final double imageHeight;
  final String image;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: imageHeight,
      pinned: true,
      backgroundColor: Colors.white,
      elevation: 0,
      flexibleSpace: FlexibleSpaceBar(
        background: Image.network(
          image,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Image.network(
              'https://static.vecteezy.com/system/resources/thumbnails/022/059/000/small_2x/no-image-available-icon-vector.jpg',
              fit: BoxFit.cover,
            );
          },
        ),
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: Container(
          height: 30,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
        ),
      ),
    );
  }
}