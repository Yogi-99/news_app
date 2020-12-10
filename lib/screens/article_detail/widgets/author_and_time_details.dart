import 'package:flutter/material.dart';
import 'package:news_app/global/resources/colors.dart';
import 'package:news_app/global/size_config.dart';
import 'package:news_app/provider/article_provider.dart';
import 'package:provider/provider.dart';

class AuthorAndTimeDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ArticleProvider>(
      builder: (context, articleProvider, child) => Padding(
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.widthMultiplier,
          vertical: SizeConfig.textMultiplier,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                articleProvider.authorProfileImage.isEmpty
                    ? CircleAvatar(
                        child: Expanded(
                            child: Container(
                          color: KGreyColor,
                        )),
                      )
                    : CircleAvatar(
                        backgroundImage:
                            NetworkImage(articleProvider.authorProfileImage),
                      ),
                SizedBox(
                  width: SizeConfig.widthMultiplier * 2,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      articleProvider.selectedArticle.author,
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2
                          .copyWith(color: KBlackColor),
                    ),
                    Text(
                      'Author',
                      style: Theme.of(context).textTheme.caption,
                    ),
                  ],
                ),
              ],
            ),
            Spacer(),
            Text(articleProvider.selectedArticle.formattedDateTimeWithYear),
          ],
        ),
      ),
    );
  }
}
