import 'package:chop_gang/features/auth/presentation/pages/login_screen.dart';
import 'package:chop_gang/features/auth/presentation/pages/sign_up.dart';
import 'package:chop_gang/features/auth/presentation/pages/verify_otp.dart';
import 'package:chop_gang/features/onboarding/onboarding_screen.dart';
import 'package:chop_gang/features/splashscreen/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part 'app_router.g.dart';

final appRouter = GoRouter(
  routes: $appRoutes,
  initialLocation: SplashScreenRoute.path,
  redirect: (context, state) {},
);

// entry point
@TypedGoRoute<SplashScreenRoute>(path: SplashScreenRoute.path)
class SplashScreenRoute extends GoRouteData with $SplashScreenRoute {
  static const path = '/';

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const Splashscreen();
}

// onboarding screen
@TypedGoRoute<OnboardingScreenRoute>(path: '/onboarding')
class OnboardingScreenRoute extends GoRouteData with $OnboardingScreenRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const OnboardingScreen();
}

// signup screen
@TypedGoRoute<SignUpRoute>(path: '/signup')
class SignUpRoute extends GoRouteData with $SignUpRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) => const SignUp();
}

// login screen
@TypedGoRoute<LoginRoute>(path: '/loginScreen')
class LoginRoute extends GoRouteData with $LoginRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const LoginScreen();
}

// verify otp screen
@TypedGoRoute<VerifyOtpRoute>(path: '/verifyOtp')
class VerifyOtpRoute extends GoRouteData with $VerifyOtpRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) => const VerifyOtp();
}
