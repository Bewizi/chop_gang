import 'package:chop_gang/core/router/app_router.dart';
import 'package:chop_gang/core/theme/app_text_theme.dart';
import 'package:chop_gang/core/ui/components/app_button.dart';
import 'package:chop_gang/core/ui/components/app_text.dart';
import 'package:chop_gang/core/ui/extension/app_spacing_extension.dart';
import 'package:chop_gang/core/ui/layouts/app_scaffold.dart';
import 'package:chop_gang/core/variables/app_images.dart';
import 'package:chop_gang/core/variables/colors.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _currentPage = 0;

  final List<OnboardingPage> pages = [
    OnboardingPage(
      title: 'Everyone picks their vibe ',
      description:
          'No more back-and-forth in group chats. See what others are adding in real time and build one shared order.',
      image: AppImages.kOnboarding1,

      backgroundColor: AppColors.kGoldenPollen400,
      textColor: AppColors.kCarbonBlack900,
    ),
    OnboardingPage(
      title: 'Squad up for food ',
      description:
          'Order together without the chaos.Create a group, invite your people, and let everyone add what they want.',
      image: AppImages.kOnboarding2,

      backgroundColor: AppColors.kDarkSpruce800,
      textColor: AppColors.kWhite,
    ),
    OnboardingPage(
      title: 'No stress, just checkout ',
      description:
          'Split payments or pay together, it’s your call. Fast, simple, and no awkward “who’s paying?” moments.',
      image: AppImages.kOnboarding3,

      backgroundColor: AppColors.kBlazeOrange500,
      textColor: AppColors.kWhite,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _startFade();
  }

  void _startFade() {
    Future.delayed(const Duration(seconds: 3), () {
      if (!mounted) return;

      setState(() {
        _currentPage = (_currentPage + 1) % pages.length;
      });

      _startFade();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      backgroundColor: pages[_currentPage].backgroundColor,
      padding: false,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // page indicator
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 24),
              child: Row(
                children: List.generate(
                  pages.length,
                  (index) => _buildPageIndicator(index == _currentPage),
                ),
              ),
            ),

            Expanded(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                switchInCurve: Curves.easeIn,
                switchOutCurve: Curves.easeOut,
                transitionBuilder: (child, animation) {
                  return FadeTransition(opacity: animation, child: child);
                },
                child: KeyedSubtree(
                  key: ValueKey<int>(_currentPage),
                  child: _buildPage(pages[_currentPage]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPage(OnboardingPage page) {
    return Container(
      decoration: BoxDecoration(
        color: page.backgroundColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                // header
                AppText(
                  page.title,
                  style: appTextTheme.displayMedium!.copyWith(
                    color: page.textColor,
                    fontFamily: 'Nectarine DEMO',
                  ),
                ),

                AppText(
                  page.description,
                  style: appTextTheme.titleMedium!.copyWith(
                    color: page.textColor,
                    fontFamily: 'Supreme',
                  ),
                ),
                24.verticalSpacing,
                AppButton(
                  onPressed: () => SignUpRoute().go(context),
                  text: 'Start a Group Order',
                  textColors: AppColors.kWhite,
                  fontFamily: 'Supreme',
                  fontWeight: FontWeight.w600,
                  width: MediaQuery.sizeOf(context).width * 0.45,
                ),
              ],
            ),
          ),

          16.verticalSpacing,
          Expanded(
            child: SizedBox(
              width: MediaQuery.sizeOf(context).width,
              child: Image.asset(
                page.image,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPageIndicator(bool isActive) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      height: 8,
      width: 100,
      decoration: BoxDecoration(
        color: isActive ? const Color(0xff152229) : const Color(0xFFF2EEEB),
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}

class OnboardingPage {
  OnboardingPage({
    required this.title,
    required this.description,
    required this.image,

    required this.backgroundColor,
    required this.textColor,
  });
  final String title;
  final String description;
  final String image;

  final Color backgroundColor;
  final Color textColor;
}
