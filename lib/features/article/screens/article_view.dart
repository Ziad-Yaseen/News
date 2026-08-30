import 'package:flutter/material.dart';
import 'package:news/core/components/primary_outlined_button.dart';
import 'package:news/core/models/article_model.dart';
import 'package:news/features/article/widgets/article_app_bar.dart';
import 'package:news/features/article/widgets/article_data.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleView extends StatelessWidget {
  const ArticleView({super.key, required this.article});

  final ArticleModel article;

  @override
  Widget build(BuildContext context) {
    final double imageHeight = MediaQuery.of(context).size.width * (316 / 430);

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          ArticleAppBar(imageHeight: imageHeight, image: article.image),
          ArticleData(
            title: article.title,
            author: article.author,
            date: article.publishedAt,
            content: article.content,
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const Spacer(),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: PrimaryOutlinedButton(
                      onPressed: () async {
                        final String urlString = article.url;
                        final Uri? parsedUrl = Uri.tryParse(urlString);
                        final bool isValidUrl =
                            urlString != 'No URL available' &&
                            parsedUrl != null &&
                            parsedUrl.hasAbsolutePath;
                        if (isValidUrl) {
                          try {
                            await launchUrl(
                              parsedUrl,
                              mode: LaunchMode.inAppWebView,
                            );
                          } catch (e) {
                            if (context.mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'An error occurred while trying to open the article.',
                                  ),
                                  backgroundColor: Colors.redAccent,
                                ),
                              );
                            }
                          }
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Sorry, this link is invalid or unavailable.',
                              ),
                              backgroundColor: Colors.redAccent,
                              behavior: SnackBarBehavior.floating,
                            ),
                          );
                        }
                      },
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
