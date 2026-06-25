import 'package:chop_gang/core/router/app_router.dart';
import 'package:chop_gang/core/theme/app_text_theme.dart';
import 'package:chop_gang/core/ui/components/app_button.dart';
import 'package:chop_gang/core/ui/components/app_text.dart';
import 'package:chop_gang/core/ui/components/app_text_field.dart';
import 'package:chop_gang/core/ui/extension/app_spacing_extension.dart';
import 'package:chop_gang/core/ui/layouts/app_scaffold.dart';
import 'package:chop_gang/core/variables/app_inset.dart';
import 'package:chop_gang/core/variables/colors.dart';
import 'package:chop_gang/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:chop_gang/features/auth/presentation/widgets/need_help.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _fullName = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _phoneNumber = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();
  final TextEditingController _referralCode = TextEditingController();

  void _signUp() {
    if (_formKey.currentState?.validate() ?? false) {
      context.read<AuthBloc>().add(
        AuthSignUpRequested(
          params: SignupParams(
            fullName: _fullName.text,
            email: _email.text,
            phone: _phoneNumber.text,
            password: _password.text,
            confirmPassword: _confirmPassword.text,
          ),
        ),
      );
    }
  }

  @override
  void dispose() {
    _fullName.dispose();
    _email.dispose();
    _phoneNumber.dispose();
    _password.dispose();
    _confirmPassword.dispose();
    _referralCode.dispose();
    super.dispose();
  }

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
                  BlocConsumer<AuthBloc, AuthState>(
                    listener: (context, state) {
                      if (state is AuthSignUpSuccess) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: AppText('Sign Up Successful'),
                          ),
                        );
                        VerifyOtpRoute(email: _email.text).push(context);
                      }
                      if (state is AuthFailure) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: AppText(state.message),
                          ),
                        );
                      }
                    },

                    builder: (context, state) {
                      return Form(
                        key: _formKey,
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
                              controller: _email,
                              validator: (value) {
                                if (!RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                                ).hasMatch(value!)) {
                                  return 'Invalid Email Address';
                                }
                                if (!value.contains('@')) {
                                  return 'Please Include @ in Email Address';
                                }

                                if (value.isEmpty) {
                                  return 'Email Address is required';
                                }
                                return null;
                              },
                            ),
                            16.verticalSpacing,
                            // phone number
                            AppTextField(
                              title: 'Phone Number',
                              hintText: 'Enter your Phone Number',
                              controller: _phoneNumber,
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Phone Number is required';
                                }
                                return null;
                              },
                            ),
                            16.verticalSpacing,
                            // password
                            AppTextField(
                              title: 'Password',
                              hintText: 'Password',
                              controller: _password,
                              obscureText: true,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Password is required';
                                }
                                return null;
                              },
                            ),
                            16.verticalSpacing,
                            // Confirm Password
                            AppTextField(
                              title: 'Confirm Password',
                              hintText: 'Confirm your Password',
                              controller: _confirmPassword,
                              obscureText: true,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Confirm Password is required';
                                }
                                if (value != _password.text) {
                                  return 'Passwords do not match';
                                }
                                return null;
                              },
                            ),
                            16.verticalSpacing,
                            // Referral Code
                            AppTextField(
                              title: 'Referral Code',
                              hintText: 'Referral Code (Optional)',
                              controller: _referralCode,
                            ),

                            24.verticalSpacing,

                            AppButton(
                              onPressed: _signUp,
                              text: 'Create Account',
                              textColors: AppColors.kWhite,
                              bgColors: AppColors.kBlazeOrange500,
                            ),
                          ],
                        ),
                      );
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
      ),
    );
  }
}
