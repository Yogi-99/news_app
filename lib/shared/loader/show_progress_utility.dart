import 'package:flutter/material.dart';
import 'package:news_app/shared/loader/progress_indicator.dart';

class ShowProgressUtility {
  static showProgressBar(bool status) => status
      ? Center(
          child: ProgressIndicatorWidget(),
        )
      : Container();
}
