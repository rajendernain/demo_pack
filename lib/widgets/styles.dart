import 'package:flutter/material.dart';

class Styles {
  static thinTextStyle({
    double size = 14,
    double height = 1.2,
    Color color = Colors.black,
    bool underLineNeeded = false,
  }) {
    return TextStyle(
      fontSize: size,
      height: height,
      fontFamily: 'poppins',
      fontWeight: FontWeight.w100,
      color: color,
      decoration:
      underLineNeeded ? TextDecoration.underline : TextDecoration.none,
    );
  }

  static normalTextStyle({
    double size = 14,
    double height = 1.2,
    Color color = Colors.black,
    bool underLineNeeded = false,
  }) {
    return TextStyle(
      fontSize: size,
      height: height,
      fontFamily: 'poppins',
      fontWeight: FontWeight.w400,
      color: color,
      decoration:
      underLineNeeded ? TextDecoration.underline : TextDecoration.none,
    );
  }

  static mediumTextStyle({
    double size = 14,
    double height = 1.2,
    Color color = Colors.black,
    bool underLineNeeded = false,
  }) {
    return TextStyle(
      fontSize: size,
      height: height,
      fontFamily: 'poppins',
      fontWeight: FontWeight.w500,
      color: color,
      decoration:
      underLineNeeded ? TextDecoration.underline : TextDecoration.none,
    );
  }

  static regularTextStyle({
    double size = 14,
    double height = 1.2,
    Color color = Colors.black,
    bool underLineNeeded = false,
  }) {
    return TextStyle(
      fontSize: size,
      fontFamily: 'poppins',
      fontWeight: FontWeight.w300,
      height: height,
      // overflow: TextOverflow.ellipsis,
      decoration:
      underLineNeeded ? TextDecoration.underline : TextDecoration.none,
      color: color,
    );
  }

  static semiBoldTextStyle({
    double size = 14,
    double height = 1.2,
    Color color = Colors.black,
    bool underLineNeeded = false,
  }) {
    return TextStyle(
      fontSize: size,
      height: height,
      fontFamily: 'poppins',
      decoration:
      underLineNeeded ? TextDecoration.underline : TextDecoration.none,
      fontWeight: FontWeight.w600,
      color: color,
    );
  }

  static boldTextStyle({
    double size = 14,
    double height = 1.2,
    Color color = Colors.black,
    bool underLineNeeded = false,
  }) {
    return TextStyle(
      fontSize: size,
      height: height,
      decoration:
      underLineNeeded ? TextDecoration.underline : TextDecoration.none,
      fontFamily: 'poppins',
      fontWeight: FontWeight.bold,
      color: color,
    );
  }

  static TextStyle? commonTextStyle(
      double fontSize, FontWeight fontWeight, Color color) {
    return TextStyle(fontSize: fontSize, fontWeight: fontWeight, color: color);
  }

  static lightTextStyle({
    double size = 16,
    double height = 1.2,
    Color color = Colors.black,
    bool underLineNeeded = false,
  }) {
    return TextStyle(
      fontSize: size,
      fontFamily: 'poppins',
      fontWeight: FontWeight.w300,
      height: height,
      // overflow: TextOverflow.ellipsis,
      decoration:
      underLineNeeded ? TextDecoration.underline : TextDecoration.none,
      color: color,
    );
  }
}
