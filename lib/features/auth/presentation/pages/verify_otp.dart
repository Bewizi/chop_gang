import 'package:chop_gang/core/router/app_router.dart';
import 'package:chop_gang/core/theme/app_text_theme.dart';
import 'package:chop_gang/core/ui/components/app_button.dart';
import 'package:chop_gang/core/ui/components/app_text.dart';
import 'package:chop_gang/core/ui/components/app_text_field.dart';
import 'package:chop_gang/core/ui/extension/app_spacing_extension.dart';
import 'package:chop_gang/core/ui/layouts/app_scaffold.dart';
import 'package:chop_gang/core/variables/app_inset.dart';
import 'package:chop_gang/core/variables/app_radius.dart';
import 'package:chop_gang/core/variables/colors.dart';
import 'package:chop_gang/features/auth/presentation/widgets/need_help.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class VerifyOtp extends StatefulWidget {
  const VerifyOtp({super.key});

  @override
  State<VerifyOtp> createState() => _VerifyOtpState();
}

class _VerifyOtpState extends State<VerifyOtp> {
  final TextEditingController _fullName = TextEditingController();
  bool isChecked = false;

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
              crossAxisAlignment: .start,
              children: [
                const Align(
                  alignment: Alignment.bottomRight,
                  child: NeedHelp(),
                ),
                16.verticalSpacing,
                AppText(
                  'Verify Otp',
                  style: appTextTheme.headlineSmall!.copyWith(
                    fontFamily: 'Satoshi',
                    color: AppColors.kCarbonBlack900,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                4.verticalSpacing,
                AppText(
                  'Enter the 6-digit code we just sent. '
                  '\nCheck your SMS or WhatsApp, your squad is waiting!',
                  style: appTextTheme.titleMedium?.copyWith(
                    fontFamily: 'Supreme',
                    color: AppColors.kCarbonBlack900,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                24.verticalSpacing,
                Form(
                  child: Column(
                    crossAxisAlignment: .start,
                    children: [
                      // email address
                      AppTextField(
                        title: 'Email Address',
                        hintText: 'Enter your Email Address',
                        controller: _fullName,
                      ),
                      16.verticalSpacing,

                      // password
                      Column(
                        crossAxisAlignment: .start,
                        children: [
                          AppTextField(
                            title: 'Password',
                            hintText: 'Password',
                            controller: _fullName,
                          ),
                          8.verticalSpacing,
                          Align(
                            alignment: Alignment.bottomRight,
                            child: GestureDetector(
                              onTap: () {},
                              child: AppText(
                                'Forgot password?',
                                style: appTextTheme.titleSmall?.copyWith(
                                  fontFamily: 'Supreme',
                                  color: AppColors.kCarbonBlack900,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      // checkbox remember me
                      Row(
                        children: [
                          Checkbox(
                            side: const BorderSide(
                              color: AppColors.kDarkSpruce800,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: AppRadius.smallRadius,
                            ),
                            value: isChecked,
                            onChanged: (value) {
                              setState(() {
                                isChecked = !isChecked;
                              });
                            },
                            fillColor: WidgetStatePropertyAll<Color>(
                              AppColors.kWhiteSmoke50.withValues(alpha: 0.5),
                            ),
                          ),
                          AppText(
                            'Remember me',
                            style: appTextTheme.titleSmall?.copyWith(
                              fontFamily: 'Supreme',
                              color: AppColors.kCarbonBlack900,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.3,
                      ),
                      AppButton(
                        onPressed: () {},
                        text: 'Login to Account',
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
                        text: 'Don’t have an account? ',
                      ),
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => SignUpRoute().go(context),
                        text: ' Create Account',
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
    );
  }
}
