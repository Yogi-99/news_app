import 'package:flutter/material.dart';
import 'package:news_app/global/resources/colors.dart';
import 'package:news_app/global/size_config.dart';
import 'package:provider/provider.dart';
import '../provider/article_provider.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ArticleProvider>(
      builder: (context, articleProvider, child) => Container(
        margin: EdgeInsets.only(top: SizeConfig.textMultiplier),
        height: kToolbarHeight * .9,
        decoration: BoxDecoration(
          color: KGreyColor.withOpacity(.3),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 10.0,
            ),
            Icon(
              Icons.search,
              color: KBoulderGreyColor,
            ),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  border: InputBorder.none,
                ),
                onChanged: articleProvider.onSearchTermChanged,
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
