import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/global/resources/colors.dart';

import '../size_config.dart';

final kTextTheme = TextTheme(
  headline1: headline1TextStyle,
  headline2: headline2TextStyle,
  headline3: headline3TextStyle,
  headline4: headline4TextStyle,
  headline5: headline5TextStyle,
  headline6: headline6TextStyle,
  subtitle1: subtitle1TextStyle,
  subtitle2: subtitle2TextStyle,
  bodyText1: bodyText1TextStyle,
  bodyText2: bodyText2TextStyle,
  button: buttonTextStyle,
  caption: captionTextStyle,
  overline: overlineTextStyle,
);

final TextStyle overlineTextStyle = GoogleFonts.montserrat(
  fontSize: SizeConfig.ten,
  fontWeight: FontWeight.w400,
  letterSpacing: 1.5,
);

final TextStyle captionTextStyle = GoogleFonts.montserrat(
  fontSize: SizeConfig.twelve,
  fontWeight: FontWeight.w400,
  letterSpacing: 0.4,
  color: KBoulderGreyColor,
);

final TextStyle buttonTextStyle = GoogleFonts.montserrat(
  fontSize: SizeConfig.fourteen,
  fontWeight: FontWeight.w500,
  letterSpacing: 1.25,
  color: KBlackColor,
);

final TextStyle bodyText2TextStyle = GoogleFonts.montserrat(
  fontSize: SizeConfig.fourteen,
  fontWeight: FontWeight.w400,
  letterSpacing: 0.25,
  color: KBlackColor,
);

final TextStyle bodyText1TextStyle = GoogleFonts.montserrat(
  fontSize: SizeConfig.sixteen,
  fontWeight: FontWeight.w400,
  letterSpacing: 0.5,
  color: KBlackColor,
);

final TextStyle subtitle2TextStyle = GoogleFonts.montserrat(
  fontSize: SizeConfig.fourteen,
  fontWeight: FontWeight.w500,
  letterSpacing: 0.1,
);

final TextStyle subtitle1TextStyle = GoogleFonts.montserrat(
  fontSize: SizeConfig.sixteen,
  fontWeight: FontWeight.w400,
  letterSpacing: 0.15,
);

final TextStyle headline6TextStyle = GoogleFonts.montserrat(
  fontSize: SizeConfig.twenty,
  fontWeight: FontWeight.w500,
  letterSpacing: 0.15,
  color: KBlackColor,
);

final TextStyle headline5TextStyle = GoogleFonts.montserrat(
  fontSize: SizeConfig.twentyFour,
  fontWeight: FontWeight.w400,
  color: KBlackColor,
);

final TextStyle headline4TextStyle = GoogleFonts.montserrat(
  fontSize: SizeConfig.thirtyFour,
  fontWeight: FontWeight.w400,
  letterSpacing: 0.25,
  color: KBlackColor,
);

final TextStyle headline3TextStyle = GoogleFonts.montserrat(
  fontSize: SizeConfig.fortyEight,
  fontWeight: FontWeight.w400,
);

final TextStyle headline2TextStyle = GoogleFonts.montserrat(
  fontSize: SizeConfig.sixtyOne,
  color: KBlackColor,
  fontWeight: FontWeight.w300,
  letterSpacing: -0.5,
);

final TextStyle headline1TextStyle = GoogleFonts.montserrat(
  fontSize: SizeConfig.ninetySeven,
  fontWeight: FontWeight.w300,
  letterSpacing: -1.5,
  color: KBlackColor,
);
