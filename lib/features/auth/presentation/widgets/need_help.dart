import 'package:chop_gang/core/theme/app_text_theme.dart';
import 'package:chop_gang/core/ui/components/app_text.dart';
import 'package:chop_gang/core/variables/app_radius.dart';
import 'package:chop_gang/core/variables/colors.dart';
import 'package:flutter/material.dart';

class NeedHelp extends StatelessWidget {
  const NeedHelp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.kHoneyDew100,
        borderRadius: AppRadius.mediumLargeRadius,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 10),
      child: AppText(
        'Need Help?',
        style: appTextTheme.titleMedium?.copyWith(
          fontFamily: 'Supreme',
          fontWeight: FontWeight.w400,
          color: AppColors.kCarbonBlack900,
        ),
      ),
    );
  }
}
