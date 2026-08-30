import 'package:flutter/material.dart';
import 'package:news/core/components/primary_outlined_button.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleActionSection extends StatelessWidget {
  const ArticleActionSection({super.key, required this.url});

  final String url;

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
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
                onPressed: () => _handleOpenArticle(context),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Future<void> _handleOpenArticle(BuildContext context) async {
    final Uri? parsedUrl = Uri.tryParse(url);
    final bool isValidUrl = url != 'No URL available' &&
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
          _showErrorSnackBar(
            context,
            'An error occurred while trying to open the article.',
          );
        }
      }
    } else {
      _showErrorSnackBar(context, 'Sorry, this link is invalid or unavailable.');
    }
  }

  void _showErrorSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.redAccent,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}