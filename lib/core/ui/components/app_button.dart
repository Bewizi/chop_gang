import 'package:chop_gang/core/theme/app_text_theme.dart';
import 'package:chop_gang/core/ui/components/app_text.dart';
import 'package:chop_gang/core/variables/app_radius.dart';
import 'package:chop_gang/core/variables/colors.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    required this.onPressed,
    required this.text,
    this.border,
    this.isBorder,
    this.isBgColor = true,
    this.textColors,
    this.bgColors,
    this.width,
    this.fontFamily,
    this.fontWeight,
    this.fontSize,
    this.isLoading,
    super.key,
  });

  final BoxBorder? border;
  final VoidCallback onPressed;
  final bool? isBorder;
  final String text;
  final bool? isBgColor;
  final Color? textColors;
  final Color? bgColors;
  final double? width;
  final String? fontFamily;
  final FontWeight? fontWeight;
  final double? fontSize;
  final bool? isLoading;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLoading == true ? null : onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        width: width ?? MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
          color: isBgColor == true
              ? bgColors ?? AppColors.kCarbonBlack900
              : AppColors.kWhite,
          borderRadius: AppRadius.mediumLargeRadius,
          border:
              border ??
              (isBorder == true
                  ? Border.all(color: AppColors.kBlazeOrange500)
                  : null),
        ),
        child: Center(
          child: isLoading == true
              ? SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: textColors ?? AppColors.kWhite,
                  ),
                )
              : AppText(
                  text,
                  style: appTextTheme.titleMedium?.copyWith(
                    color: textColors,
                    fontFamily: fontFamily,
                    fontWeight: fontWeight,
                    fontSize: fontSize,
                  ),
                ),
        ),
      ),
    );
  }
}
