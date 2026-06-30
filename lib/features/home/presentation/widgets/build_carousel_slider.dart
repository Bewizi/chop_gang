import 'dart:async';

import 'package:chop_gang/core/theme/app_text_theme.dart';
import 'package:chop_gang/core/ui/components/app_button.dart';
import 'package:chop_gang/core/ui/components/app_text.dart';
import 'package:chop_gang/core/ui/extension/app_spacing_extension.dart';
import 'package:chop_gang/core/variables/app_images.dart';
import 'package:chop_gang/core/variables/app_radius.dart';
import 'package:chop_gang/core/variables/colors.dart';
import 'package:flutter/material.dart';

class BuildCarouselSlider extends StatefulWidget {
  const BuildCarouselSlider({super.key});

  @override
  State<BuildCarouselSlider> createState() => _BuildCarouselSliderState();
}

class _BuildCarouselSliderState extends State<BuildCarouselSlider> {
  final PageController _pageController = PageController();
  Timer? _autoPlayTimer;
  final int _carouselItemCount = 2;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _startAutoPlay();
  }

  @override
  void dispose() {
    _autoPlayTimer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  void _startAutoPlay() {
    _autoPlayTimer = Timer.periodic(const Duration(seconds: 4), (timer) {
      if (mounted) {
        _currentIndex = (_currentIndex + 1) % _carouselItemCount;
        _pageController.animateToPage(
          _currentIndex,
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: PageView(
        controller: _pageController,
        children: [
          Container(
            height: MediaQuery.sizeOf(context).height * 0.2,
            decoration: BoxDecoration(
              color: AppColors.kGoldenPollen400,
              borderRadius: AppRadius.mediumLargeRadius,
            ),
            child: Stack(
              children: [
                // Text content
                Padding(
                  padding: const EdgeInsets.only(
                    left: 8,
                    top: 18,
                    bottom: 18,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        'Squad Up & Order',
                        style: appTextTheme.headlineLarge?.copyWith(
                          fontFamily: 'Nectarine DEMO',
                          color: AppColors.kWhite,
                        ),
                      ),

                      AppRichText(
                        spans: [
                          const TextSpan(
                            text: 'Create a group and enjoy ',
                          ),
                          TextSpan(
                            text: '\n20% ',
                            style: appTextTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                              color: AppColors.kFlagRed500,
                            ),
                          ),
                          const TextSpan(text: 'off together'),
                        ],
                        style: appTextTheme.titleSmall?.copyWith(
                          color: Colors.white,
                        ),
                      ),

                      24.verticalSpacing,

                      AppButton(
                        onPressed: () {},
                        text: 'Start a Squad',
                        width: 120,
                        bgColors: AppColors.kFlagRed500,
                        textColors: Colors.white,
                      ),
                    ],
                  ),
                ),

                // Rice image
                Positioned(
                  right: -5,
                  bottom: -20,
                  child: Transform.scale(
                    scale: 1.65,
                    child: Image.asset(
                      AppImages.kRiceAndChicken,
                      height: 150,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ],
            ),
          ),

          Container(
            height: MediaQuery.sizeOf(context).height * 0.2,
            decoration: BoxDecoration(
              color: AppColors.kBlazeOrange500,
              borderRadius: AppRadius.mediumLargeRadius,
            ),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 17, bottom: 17, left: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppText(
                        'Hop In & Eat',
                        style: appTextTheme.headlineLarge?.copyWith(
                          fontFamily: 'Nectarine DEMO',
                          color: AppColors.kWhite,
                        ),
                      ),
                      AppRichText(
                        spans: [
                          const TextSpan(
                            text: 'Enter a code or open a \nlink to ',
                          ),
                          TextSpan(
                            text: 'join a squad',
                            style: appTextTheme.titleSmall?.copyWith(
                              fontFamily: 'Supreme',
                              fontWeight: FontWeight.w800,
                              color: AppColors.kGoldenPollen400,
                            ),
                          ),
                        ],
                        style: appTextTheme.titleSmall?.copyWith(
                          color: AppColors.kWhite,
                        ),
                      ),

                      24.verticalSpacing,
                      AppButton(
                        onPressed: () {},
                        text: 'Join Order',
                        width: MediaQuery.sizeOf(context).width * 0.3,
                        bgColors: AppColors.kGoldenPollen400,
                        textColors: AppColors.kCarbonBlack900,
                      ),
                    ],
                  ),
                ),

                // Rice image
                Positioned(
                  top: 0,
                  right: -30,
                  bottom: 0,
                  child: Transform.scale(
                    scale: 1.35,
                    child: Transform.rotate(
                      angle: 180,
                      child: Image.asset(
                        AppImages.kRiceAndTurkey,
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
