import 'package:chop_gang/core/theme/app_text_theme.dart';
import 'package:chop_gang/core/ui/components/app_text.dart';
import 'package:chop_gang/core/variables/app_radius.dart';
import 'package:chop_gang/core/variables/colors.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    this.controller,
    this.hintText,
    this.showTitle = true,
    this.title,
    this.validator,
    this.keyboardType,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.prefixIconConstraints,
    this.onSuffixIconTap,
    this.onChanged,
    this.inputDecoration,
    this.verticalSpacing,

    super.key,
  });

  final TextEditingController? controller;
  final String? hintText;
  final bool showTitle;
  final String? title;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final bool obscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final BoxConstraints? prefixIconConstraints;
  final VoidCallback? onSuffixIconTap;
  final void Function(String)? onChanged;
  final InputDecoration? inputDecoration;
  final double? verticalSpacing;

  Widget _buildTextFormField(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      onChanged: onChanged,
      decoration:
          inputDecoration ??
          InputDecoration(
            filled: true,
            fillColor: AppColors.kWhiteSmoke50.withValues(alpha: 0.8),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppRadius.medium),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppRadius.medium),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppRadius.medium),
              borderSide: BorderSide.none,
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppRadius.medium),
              borderSide: const BorderSide(color: AppColors.kFlagRed500),
            ),
            hintText: hintText,
            contentPadding: const EdgeInsets.symmetric(
              vertical: 19,
              horizontal: 19,
            ),
            hintStyle: appTextTheme.titleSmall?.copyWith(
              color: AppColors.kCarbonBlack900,
              fontFamily: 'Supreme',
            ),
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon != null
                ? InkWell(
                    onTap: onSuffixIconTap,
                    child: suffixIcon,
                  )
                : null,
            prefixIconColor: AppColors.kCarbonBlack900,
            suffixIconColor: AppColors.kCarbonBlack900,
            prefixIconConstraints: prefixIconConstraints,
          ),
      keyboardType: keyboardType,
      obscureText: obscureText,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showTitle && title != null) ...[
          AppText(
            title!,
            style: appTextTheme.titleSmall?.copyWith(
              color: AppColors.kCarbonBlack900,
              fontFamily: 'Supreme',
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
        SizedBox(height: verticalSpacing ?? 4),
        _buildTextFormField(context),
      ],
    );
  }
}
