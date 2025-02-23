import 'package:flutter/material.dart';

import '../../core/core.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.hint,
    this.prefix,
    this.keyboardType,
    this.inputAction,
  });

  final TextEditingController controller;
  final String hint;
  final Widget? prefix;
  final TextInputType? keyboardType;
  final TextInputAction? inputAction;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onTapOutside: (_) {
        FocusScope.of(context).unfocus();
      },
      keyboardType: keyboardType,
      textInputAction: inputAction,
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        border: InputBorder.none,
        prefixIcon: prefix,
        hintText: hint,
        alignLabelWithHint: true,
        hintStyle: context.appFonts.customFont(
          fontWeight: FontWeight.w400,
          fontSize: FontSize.s13,
        ),
        isDense: true,
        contentPadding: EdgeInsets.symmetric(
          horizontal: kMargin16,
          vertical: kMargin14,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kMargin20),
          borderSide: BorderSide(color: context.appColors.transparentColor),
        ),
        filled: true,
        fillColor: context.appColors.grayColor.withValues(alpha: 0.58),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kMargin20),
          borderSide: BorderSide(color: context.appColors.transparentColor),
        ),
      ),
    );
  }
}
