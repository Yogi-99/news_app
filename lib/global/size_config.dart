import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class SizeConfig {
  static double _screenWidth;
  static double _screenHeight;
  static double _blockWidth = 0;
  static double _blockHeight = 0;
  static double textMultiplier;
  static double imageSizeMultiplier;
  static double heightMultiplier;
  static double widthMultiplier;
  static double screenHeight;
  static double screenWidth;
  static bool isPortrait = true;
  static bool isMobilePortrait = false;

  static void init(BoxConstraints constraints, Orientation orientation) {
    if (orientation == Orientation.portrait) {
      _screenWidth = constraints.maxWidth;
      _screenHeight = constraints.maxHeight;
      screenHeight = _screenHeight;
      screenWidth = _screenWidth;
      isPortrait = true;
      if (_screenWidth < 450) {
        isMobilePortrait = true;
      }
    } else {
      _screenWidth = constraints.maxHeight;
      _screenHeight = constraints.maxWidth;
      isPortrait = false;
      isMobilePortrait = false;
    }

    _blockWidth = _screenWidth / 100;
    _blockHeight = _screenHeight / 100;

    if (_screenHeight > 730) {
      textMultiplier = _blockHeight * 0.8;
    } else {
      textMultiplier = _blockHeight;
    }

    imageSizeMultiplier = _blockWidth;
    heightMultiplier = _blockHeight;
    widthMultiplier = _blockWidth;

    // block width: 4.11px
    // block height: 6.83px
  }

  static double ten = (SizeConfig.textMultiplier * 1.464);
  static double twelve = (SizeConfig.textMultiplier * 1.756);
  static double fourteen = (SizeConfig.textMultiplier * 2.049);
  static double fifteen = (SizeConfig.textMultiplier * 2.196);
  static double sixteen = (SizeConfig.textMultiplier * 2.342);
  static double twenty = (SizeConfig.textMultiplier * 2.928);
  static double twentyTwo = (SizeConfig.textMultiplier * 3.221);
  static double twentyFour = (SizeConfig.textMultiplier * 3.513);
  static double twentyEight = (SizeConfig.textMultiplier * 4.099);
  static double thirtyFour = (SizeConfig.textMultiplier * 4.978);
  static double fortyEight = (SizeConfig.textMultiplier * 7.027);
  static double sixtyOne = (SizeConfig.textMultiplier * 8.931);
  static double ninetySeven = (SizeConfig.textMultiplier * 14.202);
}
