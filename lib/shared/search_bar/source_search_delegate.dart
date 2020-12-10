import 'package:flutter/material.dart';
import 'package:news_app/global/resources/colors.dart';
import 'package:news_app/model/source.dart';
import 'package:news_app/provider/article_provider.dart';
import 'package:provider/provider.dart';

class SourceSearchDelegate extends SearchDelegate<Source> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = '';
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back_ios),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    throw Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Source> _suggestions = [];

    _suggestions = Provider.of<ArticleProvider>(context, listen: false)
        .sources
        .where((element) =>
            element.name.toLowerCase().contains(query.trim()?.toLowerCase()))
        .toList();

    return Consumer<ArticleProvider>(
      builder: (context, articleProvider, child) => ListView(
        children: _suggestions
            .map((e) => ListTile(
                  title: Text(
                    e?.name,
                    style: Theme.of(context).textTheme.bodyText1.copyWith(
                          color: KBlackColor,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  subtitle: RichText(
                    text: TextSpan(
                        style: Theme.of(context).textTheme.caption,
                        children: [
                          TextSpan(
                            text: e.category,
                          ),
                          TextSpan(text: ' · '),
                          TextSpan(text: e.language),
                        ]),
                  ),
                  onTap: () {
                    articleProvider.selectSource(e);
                    Navigator.of(context).pop();
                  },
                ))
            .toList(),
      ),
    );

    // return Consumer<ArticleProvider>(
    //   builder: (context, articleProvider, child) => ListView.separated(
    //     itemCount: _suggestions.length,
    //     separatorBuilder: (context, index) => Divider(),
    //     itemBuilder: (BuildContext context, int index) {
    //       return ListTile(
    //         title: Text(
    //           e?.name,
    //           style: Theme.of(context).textTheme.bodyText1.copyWith(
    //                 color: KBlackColor,
    //                 fontWeight: FontWeight.w600,
    //               ),
    //         ),
    //         subtitle: RichText(
    //           text: TextSpan(
    //               style: Theme.of(context).textTheme.caption,
    //               children: [
    //                 TextSpan(
    //                   text: _suggestions[index].category,
    //                 ),
    //                 TextSpan(text: ' · '),
    //                 TextSpan(text: _suggestions[index].language),
    //               ]),
    //         ),
    //         onTap: () {
    //           articleProvider.selectSource(articleProvider.sources[index]);
    //           Navigator.of(context).pop();
    //         },
    //       );
    //     },
    //   ),
    // );
  }
}
