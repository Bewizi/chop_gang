import 'package:chop_gang/core/theme/app_text_theme.dart';
import 'package:chop_gang/core/ui/components/app_text.dart';
import 'package:chop_gang/core/ui/extension/app_spacing_extension.dart';
import 'package:chop_gang/core/ui/layouts/app_scaffold.dart';
import 'package:chop_gang/core/variables/app_inset.dart';
import 'package:chop_gang/core/variables/colors.dart';
import 'package:chop_gang/features/home/presentation/widgets/build_carousel_slider.dart';
import 'package:chop_gang/features/home/presentation/widgets/build_sqaud.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      padding: false,
      body: Container(
        width: MediaQuery.sizeOf(context).width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xffFFCA26),
              Color(0xffFFD95C),
              Color(0xffFFF4CF),
              Color(0xffFFF9EC),
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: AppInset.screenSymmetric,
            child: Column(
              children: [
                _buildUserInfo(),

                16.verticalSpacing,
                const BuildCarouselSlider(),
                40.verticalSpacing,
                const BuildSqaud(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildUserInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const CircleAvatar(
              backgroundColor: AppColors.kCarbonBlack900,
              radius: 20,
            ),
            8.horizontalSpacing,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  'Welcome back, Chisom',
                  style: appTextTheme.titleMedium?.copyWith(
                    fontFamily: 'Satoshi',
                    color: AppColors.kCarbonBlack900,
                  ),
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.location_pin,
                      color: AppColors.kDarkSpruce800,
                      size: 20,
                    ),
                    8.horizontalSpacing,
                    AppText(
                      '16 Abedemi Street, Alagomeji....',
                      style: appTextTheme.titleSmall?.copyWith(
                        fontFamily: 'Supreme',
                        color: AppColors.kCarbonBlack900,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),

        //   notification
        Badge.count(
          count: 1,
          child: const Icon(Icons.notifications_none_rounded, size: 32),
        ),
      ],
    );
  }
}
