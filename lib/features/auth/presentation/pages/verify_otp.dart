import 'dart:async';

import 'package:chop_gang/core/router/app_router.dart';
import 'package:chop_gang/core/theme/app_text_theme.dart';
import 'package:chop_gang/core/ui/components/app_button.dart';
import 'package:chop_gang/core/ui/components/app_text.dart';
import 'package:chop_gang/core/ui/extension/app_spacing_extension.dart';
import 'package:chop_gang/core/ui/layouts/app_scaffold.dart';
import 'package:chop_gang/core/variables/app_inset.dart';
import 'package:chop_gang/core/variables/app_radius.dart';
import 'package:chop_gang/core/variables/app_svgs.dart';
import 'package:chop_gang/core/variables/colors.dart';
import 'package:chop_gang/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:chop_gang/features/auth/presentation/widgets/need_help.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';

class VerifyOtp extends StatefulWidget {
  const VerifyOtp({required this.email, super.key});

  final String email;

  @override
  State<VerifyOtp> createState() => _VerifyOtpState();
}

class _VerifyOtpState extends State<VerifyOtp> {
  final formKey = GlobalKey<FormState>();
  final _otpController = TextEditingController();

  String get _timerText {
    final minutes = _timerSeconds ~/ 60;
    final seconds = _timerSeconds % 60;
    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }

  bool _isTimerRunning = true;
  Timer? _timer;
  int _timerSeconds = 60;

  void _startTimer() {
    setState(() {
      _timerSeconds = 60;
      _isTimerRunning = true;
    });
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }
      setState(() {
        if (_timerSeconds > 0) {
          _timerSeconds--;
        } else {
          timer.cancel();
          _isTimerRunning = false;
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthOtpVerificationSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
          // Navigate to Home or Login
          LoginRoute().go(context);
        } else if (state is AuthFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message), backgroundColor: Colors.red),
          );
        } else if (state is AuthOtpResentSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
          _startTimer();
        }
      },
      builder: (context, state) {
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            context.pop();
                          },
                          child: SvgPicture.asset(
                            AppSvgs.kBackIconArrow,
                          ),
                        ),
                        const NeedHelp(),
                      ],
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
                    AppRichText(
                      style: appTextTheme.titleMedium?.copyWith(
                        fontFamily: 'Supreme',
                        color: AppColors.kCarbonBlack900,
                        fontWeight: FontWeight.w400,
                      ),
                      spans: [
                        const TextSpan(
                          text: 'Enter the 6-digit code we just sent to ',
                        ),
                        TextSpan(
                          text: widget.email,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const TextSpan(
                          text: '\nCheck your ',
                        ),
                        const TextSpan(
                          text: 'SMS ',
                          style: TextStyle(
                            color: AppColors.kFlagRed500,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const TextSpan(text: 'or'),
                        const TextSpan(
                          text: ' WhatsApp,',
                          style: TextStyle(
                            color: AppColors.kFlagRed500,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const TextSpan(text: ' your squad is waiting!'),
                      ],
                    ),
                    32.verticalSpacing,
                    Center(child: _buildOtpInput()),
                    32.verticalSpacing,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: _isTimerRunning
                              ? null
                              : () {
                                  context.read<AuthBloc>().add(
                                    AuthResendOtpRequested(email: widget.email),
                                  );
                                },
                          child: AppText(
                            'Resend Code',
                            style: appTextTheme.titleSmall?.copyWith(
                              color: _isTimerRunning
                                  ? AppColors.kCarbonBlack900.withValues(
                                      alpha: 0.5,
                                    )
                                  : AppColors.kCarbonBlack900,
                              fontFamily: 'Supreme',
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.underline,
                              decorationStyle: TextDecorationStyle.solid,
                            ),
                          ),
                        ),
                        // timer
                        AnimatedOpacity(
                          opacity: _isTimerRunning ? 1 : 0,
                          duration: const Duration(milliseconds: 300),
                          child: AppText(
                            _timerText,
                            style: appTextTheme.titleSmall?.copyWith(
                              color: AppColors.kCarbonBlack900,
                              fontFamily: 'Supreme',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    AppButton(
                      bgColors: AppColors.kBlazeOrange500,
                      textColors: AppColors.kWhite,
                      isLoading: state is AuthLoading,
                      text: 'Verify Otp',
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          context.read<AuthBloc>().add(
                            AuthVerifyOtpRequested(
                              email: widget.email,
                              otp: _otpController.text,
                            ),
                          );
                        }
                      },
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
        );
      },
    );
  }

  Widget _buildOtpInput() {
    return Form(
      key: formKey,
      child: Pinput(
        length: 6,
        controller: _otpController,
        defaultPinTheme: PinTheme(
          width: 56,
          height: 56,
          textStyle: const TextStyle(
            fontSize: 20,
            color: AppColors.kCarbonBlack900,
            fontWeight: FontWeight.w600,
          ),
          decoration: BoxDecoration(
            borderRadius: AppRadius.mediumRadius,
            color: AppColors.kWhiteSmoke50.withValues(alpha: 0.5),
          ),
        ),
        focusedPinTheme: PinTheme(
          width: 56,
          height: 56,
          textStyle: const TextStyle(
            fontSize: 20,
            color: AppColors.kCarbonBlack900,
            fontWeight: FontWeight.w600,
          ),
          decoration: BoxDecoration(
            borderRadius: AppRadius.mediumRadius,
            border: Border.all(color: AppColors.kCarbonBlack900),
            color: AppColors.kWhiteSmoke50.withValues(alpha: 0.5),
          ),
        ),
        validator: (value) {
          if (value == null || value.length < 6) {
            return 'Enter 6 digit OTP';
          }
          return null;
        },
      ),
    );
  }
}
