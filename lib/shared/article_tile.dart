import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/global/resources/colors.dart';
import 'package:news_app/global/size_config.dart';
import 'package:news_app/model/article.dart';

class ArticleTile extends StatelessWidget {
  final Article _article;

  const ArticleTile({
    Key key,
    @required Article article,
  })  : _article = article,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: SizeConfig.textMultiplier * 2),
      padding: EdgeInsets.only(bottom: SizeConfig.textMultiplier),
      height: SizeConfig.textMultiplier * 18,
      decoration: BoxDecoration(
        border: Border(
            bottom: BorderSide(
          color: KGreyColor.withOpacity(.1),
        )),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 7,
            child: Container(
              padding: EdgeInsets.only(right: SizeConfig.widthMultiplier * 2),
              child: Column(
                children: [
                  Text(
                    _article.title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 4,
                    style: Theme.of(context).textTheme.bodyText1.copyWith(
                          fontWeight: FontWeight.w600,
                          letterSpacing: .4,
                          color: KBlackColor,
                        ),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Text(
                        _article.source.name,
                        style: Theme.of(context).textTheme.caption,
                      ),
                      Text(
                        ' · ',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            .copyWith(color: KBoulderGreyColor),
                      ),
                      Text(
                        _article.formattedDateTime,
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            width: SizeConfig.widthMultiplier * 30,
            child: AspectRatio(
              aspectRatio: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: CachedNetworkImage(
                  imageUrl: _article.urlToImage,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
