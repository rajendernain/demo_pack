import 'package:api_projects/widgets/styles.dart';
import 'package:flutter/material.dart';

class FilledButtonWidget extends StatelessWidget {
  final void Function()? onSubmit;
  final String text;
  final double? textSize;
  final Color? textColor;
  final Color? imageColor;
  final Color? backgroundColor;
  final String? prefixImage;
  final Color? prefixImageColor;
  final String? suffixImage;
  final Color? suffixImageColor;
  final double? imageSize;
  final double? elevated;
  final FontWeight? fontWeight;
  final double? width;
  final double? height;

  const FilledButtonWidget({
    Key? key,
    required this.onSubmit,
    required this.text,
    this.textSize,
    this.textColor,
    this.backgroundColor,
    this.prefixImage,
    this.prefixImageColor,
    this.suffixImage,
    this.suffixImageColor,
    this.imageSize,
    this.elevated,
    this.imageColor,
    this.fontWeight,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 45,
      width: width,

      child: Scrollbar(
        child: ElevatedButton(
          style: ButtonStyle(
              padding: MaterialStateProperty.all<EdgeInsets>(
                  const EdgeInsets.symmetric(horizontal: 8)),
              elevation: MaterialStateProperty.all(elevated),
              backgroundColor: MaterialStateProperty.all<Color?>(
                  backgroundColor ?? Colors.red),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6.0),
                    // side: BorderSide(color: Colors.red)
                  ))),
          onPressed: onSubmit,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (prefixImage != null)
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.005,
                  ),
                  child: Image.asset(
                    prefixImage.toString(),
                    height: imageSize,
                    color: imageColor,
                  ),
                ),
              Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.006,
                      vertical: MediaQuery.of(context).size.height * 0.01),
                  child: Text(text,
                      style: Styles.mediumTextStyle(
                          color: textColor ?? Colors.white,
                          size: textSize ?? 16))),
              if (suffixImage != null)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  child: Image.asset(
                    suffixImage.toString(),
                    height: imageSize,
                    color: imageColor,
                  ),
                ),
            ],
          ),
        ),
      ),
      // ),
    );
  }
}
