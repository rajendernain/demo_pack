import 'package:api_projects/widgets/styles.dart';
import 'package:api_projects/widgets/text_widget.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

import '../common/common.dart';


class LabelTextFieldWidget extends StatelessWidget {
  final String label;
  final String? hintText;
  final String? errorMessage;
  final bool? isObscure;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final Function(String)? onChanged;
  final Function()? onTap;
  final Function(String)? onSubmitted;
  final Function()? onEditingComplete;
  final bool? readOnly;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final BoxConstraints? prefixIconConstraints;
  final int? maxLines;
  final FontWeight? labelFontWeight;
  final double? labelTextFieldSpacing;
  final TextCapitalization? textCapitalization;
  final List<TextInputFormatter>? inputFormatters;

  const LabelTextFieldWidget({
    Key? key,
    GlobalKey<FormState>? formKey,
    required this.label,
    this.hintText,
    this.errorMessage,
    required this.controller,
    this.keyboardType,
    this.onChanged,
    this.onTap,
    this.onSubmitted,
    this.onEditingComplete,
    this.readOnly,
    this.suffixIcon,
    this.prefixIcon,
    this.prefixIconConstraints,
    this.isObscure,
    this.maxLines,
    this.labelFontWeight,
    this.labelTextFieldSpacing,
    this.textCapitalization,
    this.inputFormatters,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(
          label,
          color: Color(0xff000000),
          size: 14,
          weight: labelFontWeight ?? FontWeight.w300,
        ),
        vSpace(labelTextFieldSpacing ?? 5),
        TextField(
          maxLines: maxLines,
          controller: controller,
          keyboardType: keyboardType,
          onChanged: onChanged,
          readOnly: readOnly ?? false,
          onTap: onTap,
          textCapitalization: textCapitalization ?? TextCapitalization.none,
          inputFormatters: inputFormatters,
          onSubmitted: (val) {
            FocusScope.of(context).unfocus();
            if (onSubmitted != null) {
              onSubmitted!(val);
            }
          },
          onEditingComplete: onEditingComplete,
          obscureText: isObscure ?? false,
          style: Styles.normalTextStyle(
            size: 14,
          ),
          decoration: InputDecoration(
            contentPadding:
            const EdgeInsets.only(left: 20, top: 20, bottom: 0, right: 20),
            // errorText: errorMessage,

            suffixIconConstraints:
            const BoxConstraints(maxHeight: 50, maxWidth: 65),
            suffixIcon: suffixIcon,
            errorStyle: Styles.normalTextStyle(
              size: 13,
              color: Color(0xffE2192B),
            ),
            hintText: hintText,
            hintStyle: Styles.regularTextStyle(
              size: 14,
              color: Color(0xff000000).withOpacity(0.4),
            ),
            focusedBorder: errorMessage == null
                ? OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: const BorderSide(
                width: 1,
                color: Color(0xffE2192B),
              ),
            )
                : OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: const BorderSide(
                  width: 1, color: Color(0xffE2192B)),
            ),
            border: errorMessage == null
                ? OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: const BorderSide(
                width: 1,
                color: Color(0xffE2192B),
              ),
            )
                : OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: const BorderSide(
                  width: 1, color: Color(0xffE2192B)),
            ),
            enabledBorder: errorMessage == null
                ? OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: const BorderSide(
                width: 1,
                color:Color(0xffE2192B),
              ),
            )
                : OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: const BorderSide(
                  width: 1, color: Color(0xffE2192B)),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide:
              const BorderSide(width: 1, color: Color(0xffE2192B)),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: const BorderSide(
                width: 1,
                color: Color(0xffE6E6E6),
              ),
            ),
            prefixIconConstraints: prefixIconConstraints,
            prefixIcon: prefixIcon,
          ),
        ),
        errorMessage != null
            ? Column(
          children: [
            vSpace(5),
            TextWidget(
              errorMessage!,
              size: 12,
              color: Colors.red,
            ),
          ],
        )
            : const SizedBox.shrink()
      ],
    );
  }
}
