import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Widget hSpace(double space) {
  return SizedBox(
    width: space,
  );
}

Widget vSpace(double space) {
  return SizedBox(
    height: space,
  );
}

void toast(String msg, Color bColor) async {
  await Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      textColor: Colors.white,
      backgroundColor: bColor,
      fontSize: 16.0);
}

// Widget thickDivider() {
//   return Container(
//     height: 4.5,
//     decoration: const BoxDecoration(
//       color: AppTheme.dividerColor,
//       border: Border(top: BorderSide(color: AppTheme.greyColor, width: 1)),
//     ),
//   );
// }