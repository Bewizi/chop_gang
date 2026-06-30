import 'package:chop_gang/core/theme/app_text_theme.dart';
import 'package:chop_gang/core/ui/components/app_text.dart';
import 'package:chop_gang/core/ui/extension/app_spacing_extension.dart';
import 'package:chop_gang/core/variables/app_images.dart';
import 'package:chop_gang/core/variables/app_radius.dart';
import 'package:chop_gang/core/variables/colors.dart';
import 'package:flutter/material.dart';

class BuildSqaud extends StatefulWidget {
  const BuildSqaud({super.key});

  @override
  State<BuildSqaud> createState() => _BuildSqaudState();
}

class _BuildSqaudState extends State<BuildSqaud> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.sizeOf(context).width,
                    height: MediaQuery.sizeOf(context).height * 0.18,
                    decoration: BoxDecoration(
                      border: BoxBorder.all(color: AppColors.kDarkSpruce800),
                      color: AppColors.kBlazeOrange500,
                      borderRadius: AppRadius.largeRadius,
                      image: const DecorationImage(
                        image: AssetImage(AppImages.kStartSquad),
                        fit: BoxFit.cover,
                        // centerSlice: Rect.fromLTRB(0, 1, 2, 0),
                        alignment: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                  8.verticalSpacing,
                  AppText(
                    'Start Your Squad',
                    style: appTextTheme.titleMedium?.copyWith(
                      fontFamily: 'Supreme',
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: AppColors.kCarbonBlack900,
                    ),
                  ),
                ],
              ),
            ),

            24.horizontalSpacing,
            Expanded(
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.sizeOf(context).width,
                    height: MediaQuery.sizeOf(context).height * 0.18,
                    decoration: BoxDecoration(
                      border: BoxBorder.all(color: AppColors.kDarkSpruce800),
                      color: AppColors.kBlazeOrange500,
                      borderRadius: AppRadius.largeRadius,
                      image: const DecorationImage(
                        image: AssetImage(AppImages.kJoinSquad),
                        fit: BoxFit.cover,

                        alignment: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                  8.verticalSpacing,
                  AppText(
                    'Join the Squad',
                    style: appTextTheme.titleMedium?.copyWith(
                      fontFamily: 'Supreme',
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: AppColors.kCarbonBlack900,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
