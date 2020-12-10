import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../global/resources/colors.dart';
import '../../global/size_config.dart';
import '../../provider/article_provider.dart';
import '../../shared/button_widget.dart';
import '../../shared/custom_network_image.dart';
import 'widgets/author_and_time_details.dart';

class ArticleDetailScreen extends StatelessWidget {
  static const String id = 'article_detail_screen';

  @override
  Widget build(BuildContext context) {
    return Consumer<ArticleProvider>(
      builder: (context, articleProvider, child) => Scaffold(
        appBar: _appBar(context, articleProvider),
        body: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 5),
          child: Column(
            children: [
              Text(
                articleProvider.selectedArticle.title,
                style: Theme.of(context).textTheme.headline5,
              ),
              Spacer(),
              AuthorAndTimeDetails(),
              Spacer(),
              Hero(
                tag: articleProvider.selectedArticle.url,
                child: CustomNetworkImage(
                    imageUrl: articleProvider.selectedArticle.urlToImage),
              ),
              Spacer(),
              Text(
                articleProvider.selectedArticle.description,
                style: Theme.of(context)
                    .textTheme
                    .subtitle2
                    .copyWith(color: KBoulderGreyColor, letterSpacing: .5),
                textAlign: TextAlign.center,
              ),
              Spacer(
                flex: 3,
              ),
              Text(
                articleProvider.selectedArticle.content,
                style: Theme.of(context).textTheme.bodyText1,
                textAlign: TextAlign.justify,
              ),
              Spacer(
                flex: 6,
              ),
              ButtonWidget(
                onClick: () {},
              ),
              SizedBox(
                height: SizeConfig.textMultiplier,
              ),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _appBar(
          BuildContext context, ArticleProvider articleProvider) =>
      AppBar(
        centerTitle: true,
        title: Text(
          articleProvider.selectedArticle.source.name,
          style: Theme.of(context)
              .textTheme
              .bodyText1
              .copyWith(fontWeight: FontWeight.w600),
        ),
        leading: Icon(
          Icons.arrow_back_ios,
          color: KBlackColor,
        ),
      );
}
