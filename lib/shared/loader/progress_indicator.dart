import 'package:flutter/material.dart';
import 'package:news_app/global/resources/colors.dart';

class ProgressIndicatorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.transparent,
          valueColor: AlwaysStoppedAnimation<Color>(KBlackColor),
        ),
      ),
    );
  }
}
