// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
  $splashScreenRoute,
  $onboardingScreenRoute,
  $signUpRoute,
  $loginRoute,
  $verifyOtpRoute,
  $appShellRouteData,
];

RouteBase get $splashScreenRoute =>
    GoRouteData.$route(path: '/', factory: $SplashScreenRoute._fromState);

mixin $SplashScreenRoute on GoRouteData {
  static SplashScreenRoute _fromState(GoRouterState state) =>
      SplashScreenRoute();

  @override
  String get location => GoRouteData.$location('/');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $onboardingScreenRoute => GoRouteData.$route(
  path: '/onboarding',
  factory: $OnboardingScreenRoute._fromState,
);

mixin $OnboardingScreenRoute on GoRouteData {
  static OnboardingScreenRoute _fromState(GoRouterState state) =>
      OnboardingScreenRoute();

  @override
  String get location => GoRouteData.$location('/onboarding');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $signUpRoute =>
    GoRouteData.$route(path: '/signup', factory: $SignUpRoute._fromState);

mixin $SignUpRoute on GoRouteData {
  static SignUpRoute _fromState(GoRouterState state) => SignUpRoute();

  @override
  String get location => GoRouteData.$location('/signup');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $loginRoute =>
    GoRouteData.$route(path: '/loginScreen', factory: $LoginRoute._fromState);

mixin $LoginRoute on GoRouteData {
  static LoginRoute _fromState(GoRouterState state) => LoginRoute();

  @override
  String get location => GoRouteData.$location('/loginScreen');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $verifyOtpRoute =>
    GoRouteData.$route(path: '/verifyOtp', factory: $VerifyOtpRoute._fromState);

mixin $VerifyOtpRoute on GoRouteData {
  static VerifyOtpRoute _fromState(GoRouterState state) =>
      VerifyOtpRoute(email: state.uri.queryParameters['email']!);

  VerifyOtpRoute get _self => this as VerifyOtpRoute;

  @override
  String get location =>
      GoRouteData.$location('/verifyOtp', queryParams: {'email': _self.email});

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $appShellRouteData => StatefulShellRouteData.$route(
  factory: $AppShellRouteDataExtension._fromState,
  branches: [
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(path: '/home', factory: $HomeRoute._fromState),
      ],
    ),
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(
          path: '/group-order',
          factory: $GroupOrderPageRoute._fromState,
        ),
      ],
    ),
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(path: '/order', factory: $OrderPageRoute._fromState),
      ],
    ),
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(path: '/chat', factory: $ChatPageRoute._fromState),
      ],
    ),
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(
          path: '/profile',
          factory: $ProfilePageRoute._fromState,
        ),
      ],
    ),
  ],
);

extension $AppShellRouteDataExtension on AppShellRouteData {
  static AppShellRouteData _fromState(GoRouterState state) =>
      const AppShellRouteData();
}

mixin $HomeRoute on GoRouteData {
  static HomeRoute _fromState(GoRouterState state) => const HomeRoute();

  @override
  String get location => GoRouteData.$location('/home');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $GroupOrderPageRoute on GoRouteData {
  static GroupOrderPageRoute _fromState(GoRouterState state) =>
      const GroupOrderPageRoute();

  @override
  String get location => GoRouteData.$location('/group-order');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $OrderPageRoute on GoRouteData {
  static OrderPageRoute _fromState(GoRouterState state) =>
      const OrderPageRoute();

  @override
  String get location => GoRouteData.$location('/order');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $ChatPageRoute on GoRouteData {
  static ChatPageRoute _fromState(GoRouterState state) => const ChatPageRoute();

  @override
  String get location => GoRouteData.$location('/chat');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $ProfilePageRoute on GoRouteData {
  static ProfilePageRoute _fromState(GoRouterState state) =>
      const ProfilePageRoute();

  @override
  String get location => GoRouteData.$location('/profile');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}
