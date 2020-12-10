import 'package:flutter/material.dart';
import 'package:news_app/shared/search_bar/source_search_delegate.dart';
import 'package:provider/provider.dart';

import '../../global/resources/colors.dart';
import '../../global/size_config.dart';
import '../../provider/article_provider.dart';

class SearchBar extends StatelessWidget {
  final bool showDropdown;

  const SearchBar({
    Key key,
    this.showDropdown = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ArticleProvider>(
      builder: (context, articleProvider, child) => Container(
        width: SizeConfig.screenWidth,
        child: Row(
          children: [
            Expanded(
              child: _search(articleProvider, context),
            ),
            SizedBox(
              width: SizeConfig.widthMultiplier,
            ),
            !showDropdown
                ? Expanded(
                    child: SearchBarBody(
                      child: GestureDetector(
                        onTap: () {
                          showSearch(
                              context: context,
                              delegate: SourceSearchDelegate());
                        },
                        child: Container(
                          width: SizeConfig.widthMultiplier * 40,
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            articleProvider.selectedSource.name,
                            style:
                                Theme.of(context).textTheme.bodyText1.copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: KBoulderGreyColor,
                                      letterSpacing: .3,
                                    ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          alignment: Alignment.center,
                        ),
                      ),
                    ),
                  )
                : Container()
          ],
        ),
      ),
    );
  }

  _search(ArticleProvider articleProvider, BuildContext context) =>
      SearchBarBody(
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
      );
}

class SearchBarBody extends StatelessWidget {
  final Widget child;

  const SearchBarBody({
    Key key,
    @required this.child,
  })  : assert(child != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: SizeConfig.textMultiplier),
      height: kToolbarHeight * .9,
      decoration: BoxDecoration(
        color: KGreyColor.withOpacity(.3),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: child,
    );
  }
}
