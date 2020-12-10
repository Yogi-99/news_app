import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news_app/global/resources/colors.dart';
import 'package:news_app/global/resources/icons.dart';
import 'package:news_app/global/size_config.dart';
import 'package:news_app/provider/article_provider.dart';
import 'package:news_app/shared/custom_network_image.dart';
import 'package:provider/provider.dart';

class ArticleDetailScreen extends StatelessWidget {
  static const String id = 'article_detail_screen';

  @override
  Widget build(BuildContext context) {
    return Consumer<ArticleProvider>(
      builder: (context, articleProvider, child) => Scaffold(
        appBar: AppBar(
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
        ),
        body: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 4),
          child: Column(
            children: [
              Text(
                articleProvider.selectedArticle.title,
                style: Theme.of(context).textTheme.headline5,
              ),
              Spacer(),
              Hero(
                tag: articleProvider.selectedArticle.url,
                child: CustomNetworkImage(
                    imageUrl: articleProvider.selectedArticle.urlToImage),
              ),
              Row(
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        KPersonSolidIcon,
                        height: SizeConfig.textMultiplier * 5,
                      ),
                      Column(
                        children: [
                          Text(articleProvider.selectedArticle.author),
                          Text(
                            'Author',
                            style: Theme.of(context).textTheme.caption,
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
              Spacer(
                flex: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
