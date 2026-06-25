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
import 'package:chop_gang/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:chop_gang/features/auth/presentation/widgets/need_help.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isChecked = false;
  bool _isPasswordVisible = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  void _login() {
    if (_formKey.currentState?.validate() ?? false) {
      context.read<AuthBloc>().add(
        AuthLoginRequested(
          email: _email.text,
          password: _password.text,
        ),
      );
    }
  }

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
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
                  'Back to the squad! ',
                  style: appTextTheme.headlineSmall!.copyWith(
                    fontFamily: 'Supreme',
                    color: AppColors.kCarbonBlack900,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                4.verticalSpacing,
                AppText(
                  'Welcome back! Log in to your account and start ordering '
                  'with your squad.',
                  style: appTextTheme.titleMedium?.copyWith(
                    fontFamily: 'Supreme',
                    color: AppColors.kCarbonBlack900,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                24.verticalSpacing,
                BlocConsumer<AuthBloc, AuthState>(
                  listener: (context, state) {
                    if (state is AuthLoginSuccess) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: AppText('Login Successful'),
                        ),
                      );
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
                        crossAxisAlignment: .start,
                        children: [
                          // email address
                          AppTextField(
                            title: 'Email Address',
                            hintText: 'Enter your Email Address',
                            controller: _email,
                            prefixIcon: const Icon(
                              Icons.mail_outline_rounded,
                              size: 20,
                            ),
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

                          // password
                          Column(
                            crossAxisAlignment: .start,
                            children: [
                              AppTextField(
                                title: 'Password',
                                hintText: 'Password',
                                controller: _password,
                                obscureText: !_isPasswordVisible,
                                prefixIcon: const Icon(
                                  Icons.lock_outline_rounded,
                                  size: 20,
                                ),
                                suffixIcon: Icon(
                                  _isPasswordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  size: 20,
                                ),
                                onSuffixIconTap: _togglePasswordVisibility,
                                validator: (value) {
                                  if (value!.length < 8) {
                                    return 'Password must be at least 8 characters';
                                  }

                                  if (value.isEmpty) {
                                    return 'Password is required';
                                  }
                                  return null;
                                },
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
                                  AppColors.kWhiteSmoke50.withValues(
                                    alpha: 0.5,
                                  ),
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
                            onPressed: _login,
                            isLoading: state is AuthLoading,
                            text: 'Login to Account',
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
