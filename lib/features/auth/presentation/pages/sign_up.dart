import 'package:chop_gang/core/router/app_router.dart';
import 'package:chop_gang/core/theme/app_text_theme.dart';
import 'package:chop_gang/core/ui/components/app_button.dart';
import 'package:chop_gang/core/ui/components/app_text.dart';
import 'package:chop_gang/core/ui/components/app_text_field.dart';
import 'package:chop_gang/core/ui/extension/app_spacing_extension.dart';
import 'package:chop_gang/core/ui/layouts/app_scaffold.dart';
import 'package:chop_gang/core/variables/app_inset.dart';
import 'package:chop_gang/core/variables/colors.dart';
import 'package:chop_gang/features/auth/presentation/widgets/need_help.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _fullName = TextEditingController();

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
        child: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: AppInset.screenSymmetric,
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  const Align(
                    alignment: Alignment.bottomRight,
                    child: NeedHelp(),
                  ),
                  16.verticalSpacing,

                  AppText(
                    'Join the ChowGang!',
                    style: appTextTheme.headlineSmall!.copyWith(
                      fontFamily: 'Supreme',
                      color: AppColors.kCarbonBlack900,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  4.verticalSpacing,
                  AppText(
                    'Sign up and start ordering with your squad. \nNo stress, just '
                    'good food and good vibes.',
                    style: appTextTheme.titleMedium?.copyWith(
                      fontFamily: 'Supreme',
                      color: AppColors.kCarbonBlack900,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  24.verticalSpacing,
                  Form(
                    child: Column(
                      children: [
                        // full name
                        AppTextField(
                          title: 'Full Name',
                          hintText: 'Enter your Full Name',
                          controller: _fullName,
                        ),
                        16.verticalSpacing,
                        // email address
                        AppTextField(
                          title: 'Email Address',
                          hintText: 'Enter your Email Address',
                          controller: _fullName,
                        ),
                        16.verticalSpacing,
                        // phone numer
                        AppTextField(
                          title: 'Phone Number',
                          hintText: 'Enter your Phone Number',
                          controller: _fullName,
                        ),
                        16.verticalSpacing,
                        // password
                        AppTextField(
                          title: 'Password',
                          hintText: 'Password',
                          controller: _fullName,
                        ),
                        16.verticalSpacing,
                        // Confirm Password
                        AppTextField(
                          title: 'Confirm Password',
                          hintText: 'Confirm your Password',
                          controller: _fullName,
                        ),
                        16.verticalSpacing,
                        // Referral Code
                        AppTextField(
                          title: 'Referral Code',
                          hintText: 'Referral Code (Optional)',
                          controller: _fullName,
                        ),

                        24.verticalSpacing,

                        AppButton(
                          onPressed: () {},
                          text: 'Create Account',
                          textColors: AppColors.kWhite,
                          bgColors: AppColors.kBlazeOrange500,
                        ),
                      ],
                    ),
                  ),
                  8.verticalSpacing,
                  Center(
                    child: AppRichText(
                      style: appTextTheme.titleMedium?.copyWith(
                        color: AppColors.kCarbonBlack900,
                        fontFamily: 'Supreme',
                      ),
                      spans: [
                        const TextSpan(
                          text: 'Already have an account?',
                        ),
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => LoginRoute().go(context),
                          text: ' Login',
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            decorationStyle: TextDecorationStyle.solid,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
