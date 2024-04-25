import 'package:api_projects/widgets/styles.dart';
import 'package:api_projects/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../common/common.dart';

class LabelPasswordTextfieldWidget extends StatefulWidget {
  final String label;
  final String? hintText;
  final String? errorMessage;
  final bool? isObscure;
  final TextEditingController controller;

  final TextInputType keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final Function(String)? onChanged;
  final Function()? onTap;
  final Function(String)? onSubmited;
  final Function()? onEditingComplete;
  final bool? readOnly;
  final Widget? suffixIcon;

  const LabelPasswordTextfieldWidget(
      {Key? key,
        required GlobalKey<FormState> formKey,
        required this.label,
        this.hintText,
        required this.errorMessage,
        required this.controller,
        required this.keyboardType,
        required this.onChanged,
        this.onTap,
        this.onSubmited,
        this.onEditingComplete,
        this.readOnly,
        this.suffixIcon,
        this.isObscure,
        this.inputFormatters})
      : super(key: key);

  @override
  State<LabelPasswordTextfieldWidget> createState() =>
      _LabelPasswordTextfieldWidgetState();
}

class _LabelPasswordTextfieldWidgetState
    extends State<LabelPasswordTextfieldWidget> {
  bool isObscured = false;

  @override
  void initState() {
    isObscured = widget.isObscure ?? false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(
          widget.label,
          color: Colors.black,
          size: 14,
          style: Styles.regularTextStyle(),
        ),
        const SizedBox(
          height: 5,
        ),
        TextField(
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          onChanged: widget.onChanged,
          readOnly: widget.readOnly ?? false,
          onTap: widget.onTap,
          onSubmitted: (val) {
            FocusScope.of(context).unfocus();
            if (widget.onSubmited != null) {
              widget.onSubmited!(val);
            }
          },
          onEditingComplete: widget.onEditingComplete,
          obscureText: isObscured,
          inputFormatters: widget.inputFormatters,
          style: Styles.normalTextStyle(
            color: Colors.black,
            size: 14,
          ),
          decoration: InputDecoration(
            contentPadding:
            const EdgeInsets.only(left: 20, top: 10, bottom: 10, right: 20),
            suffixIconConstraints:
            const BoxConstraints(maxHeight: 25, maxWidth: 45),
            suffixIcon: (() {
              if (widget.suffixIcon != null) {
                return widget.suffixIcon;
              } else if (widget.isObscure != null) {
                return Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isObscured = !isObscured;
                        });
                      },
                      child: Icon(
                        isObscured
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: Colors.black,
                      )),
                );
              } else {
                return null;
              }
            }()),
            errorStyle: Styles.normalTextStyle(
              color: Color(0xffE2192B),
              size: 13,
            ),
            hintText: widget.hintText,
            hintStyle: Styles.normalTextStyle(
              color: Colors.black.withOpacity(0.4),
              size: 13,
            ),
            focusedBorder: widget.errorMessage == null
                ? OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: const BorderSide(
                width: 1,
                color: Color(0xffE6E6E6),
              ),
            )
                : OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: const BorderSide(
                  width: 1, color: Color(0xffE2192B)),
            ),
            border: widget.errorMessage == null
                ? OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: const BorderSide(
                width: 1,
                color: Color(0xffE6E6E6),
              ),
            )
                : OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: const BorderSide(
                  width: 1, color: Color(0xffE2192B)),
            ),
            enabledBorder: widget.errorMessage == null
                ? OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: const BorderSide(
                width: 1,
                color: Color(0xffE6E6E6),
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
          ),
        ),
        widget.errorMessage != null
            ? Column(
          children: [
            vSpace(5),
            TextWidget(
              widget.errorMessage!,
              size: 12,
              color: Color(0xffE2192B),
            ),
          ],
        )
            : const SizedBox.shrink()
      ],
    );
  }
}
