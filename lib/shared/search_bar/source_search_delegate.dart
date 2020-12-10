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
    return Consumer<ArticleProvider>(
      builder: (context, articleProvider, child) => ListView.builder(
        itemCount: articleProvider.sources.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(
              articleProvider.sources[index].name,
              style: Theme.of(context).textTheme.subtitle2.copyWith(
                    color: KBlackColor,
                  ),
            ),
            onTap: () {
              articleProvider.selectSource(articleProvider.sources[index]);
              Navigator.of(context).pop();
            },
          );
        },
      ),
    );
  }
}
