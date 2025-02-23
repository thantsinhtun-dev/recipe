
import 'package:flutter/material.dart';

import '../../core/core.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    this.width,
    this.height,
    this.shapeBorder,
    required this.label,
    this.style,
    this.padding,
  });

  final double? width;
  final double? height;
  final ShapeBorder? shapeBorder;
  final String label;
  final TextStyle? style;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {},
      padding: padding ?? EdgeInsets.symmetric(horizontal: kMargin16),
      minWidth: width,
      height: height ?? 50,
      color: context.appColors.primaryColor,
      shape: shapeBorder ??
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kMargin20),
          ),
      child: Text(
        label,
        style: style ??
            context.appFonts.customFont(
              fontSize: FontSize.s16,
              fontWeight: FontWeight.w400,
              color: context.appColors.whiteColor,
            ),
      ),
    );
  }
}

