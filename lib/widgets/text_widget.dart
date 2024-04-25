import 'package:flutter/material.dart';

class TextWidget extends StatefulWidget {
  final double? size;
  final String data;
  final Color? color;
  final FontWeight? weight;
  final bool? italic;
  final bool? centerAlign;
  final TextDecoration? decoration;
  final String? fontFamily;
  final double? height;
  final TextOverflow? overflow;
  final int? maxlines;
  final TextStyle? style;
  const TextWidget(this.data,
      {Key? key,
        this.size = 15,
        this.color,
        this.weight,
        this.decoration,
        this.italic,
        this.centerAlign,
        this.fontFamily,
        this.height,
        this.overflow,
        this.maxlines,
        this.style})
      : super(key: key);

  @override
  State<TextWidget> createState() => _TextWidgetState();
}

class _TextWidgetState extends State<TextWidget> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.data,
      textAlign: widget.centerAlign == null ? TextAlign.left : TextAlign.center,
      overflow: widget.overflow,
      maxLines: widget.maxlines,
      softWrap: true,
      style: widget.style ??
          TextStyle(
              height: widget.height,
              fontSize: widget.size!,
              //overflow: TextOverflow.ellipsis,
              color: widget.color ?? Colors.black,
              fontWeight: widget.weight ?? FontWeight.normal,
              fontFamily: "poppins",
              fontStyle:
              widget.italic == null ? FontStyle.normal : FontStyle.italic,
              decoration: widget.decoration ?? TextDecoration.none),
    );
  }
}
