import 'package:flutter/material.dart';
import 'package:news_app/global/resources/colors.dart';
import 'package:news_app/provider/article_provider.dart';
import 'package:news_app/screens/web_view_screen/provider/web_view_provider.dart';
import 'package:news_app/shared/loader/show_progress_utility.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatelessWidget {
  static const String id = 'web_view_screen';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<WebViewProvider>(
      create: (context) => WebViewProvider(context),
      child: Consumer<WebViewProvider>(
          builder: (context, webViewProvider, child) => Scaffold(
                appBar: _appBar(context),
                body: Stack(
                  children: [
                    WebView(
                      initialUrl: webViewProvider.url,
                      onPageFinished: webViewProvider.onPageLoaded,
                      onPageStarted: webViewProvider.onPageStarted,
                    ),
                    ShowProgressUtility.showProgressBar(
                        webViewProvider.isLoading)
                  ],
                ),
              )),
    );
  }

  AppBar _appBar(BuildContext context) => AppBar(
        title: Text(
          Provider.of<ArticleProvider>(context, listen: false)
              .selectedArticle
              .source
              .name,
          style: Theme.of(context)
              .textTheme
              .bodyText1
              .copyWith(letterSpacing: 4, fontWeight: FontWeight.w600),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.clear,
            color: KBlackColor,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      );
}
