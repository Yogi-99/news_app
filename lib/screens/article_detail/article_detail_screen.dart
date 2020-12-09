import 'package:flutter/material.dart';
import 'package:news_app/provider/article_provider.dart';
import 'package:news_app/shared/custom_network_image.dart';
import 'package:provider/provider.dart';

class ArticleDetailScreen extends StatelessWidget {
  static const String id = 'article_detail_screen';

  @override
  Widget build(BuildContext context) {
    return Consumer<ArticleProvider>(
      builder: (context, articleProvider, child) => Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Hero(
              tag: articleProvider.selectedArticle.url,
              child: CustomNetworkImage(
                  imageUrl: articleProvider.selectedArticle.urlToImage),
            )
          ],
        ),
      ),
    );
  }
}
