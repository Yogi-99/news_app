import 'package:flutter/material.dart';

class NoArticleAvailable extends StatelessWidget {
  const NoArticleAvailable({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('No Article Available.'),
    );
  }
}
