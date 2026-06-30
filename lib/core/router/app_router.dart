import 'package:chop_gang/core/theme/app_text_theme.dart';
import 'package:chop_gang/core/variables/colors.dart';
import 'package:chop_gang/features/auth/presentation/pages/login_screen.dart';
import 'package:chop_gang/features/auth/presentation/pages/sign_up.dart';
import 'package:chop_gang/features/auth/presentation/pages/verify_otp.dart';
import 'package:chop_gang/features/chat/presentation/pages/chat_screen.dart';
import 'package:chop_gang/features/group_order/presentation/pages/group_order_screen.dart';
import 'package:chop_gang/features/home/presentation/pages/home_screen.dart';
import 'package:chop_gang/features/onboarding/onboarding_screen.dart';
import 'package:chop_gang/features/order/presentation/pages/order_screen.dart';
import 'package:chop_gang/features/profile/presentation/pages/profile_screen.dart';
import 'package:chop_gang/features/splashscreen/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part 'app_router.g.dart';

final appRouter = GoRouter(
  routes: $appRoutes,
  initialLocation: SplashScreenRoute.path,
  redirect: (context, state) => null,
);

// entry point
@TypedGoRoute<SplashScreenRoute>(path: '/')
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
  const VerifyOtpRoute({required this.email});

  final String email;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      VerifyOtp(email: email);
}

//MAIN APP SHELL WITH BOTTOM NAV  (NESTED ROUTING)
class HomeBranchData extends StatefulShellBranchData {
  const HomeBranchData();
}

class HomeRoute extends GoRouteData with $HomeRoute {
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const HomeScreen();
}

class GroupOrderBranchData extends StatefulShellBranchData {
  const GroupOrderBranchData();
}

class GroupOrderPageRoute extends GoRouteData with $GroupOrderPageRoute {
  const GroupOrderPageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const GroupOrderScreen();
}

class OrderBranchData extends StatefulShellBranchData {
  const OrderBranchData();
}

class OrderPageRoute extends GoRouteData with $OrderPageRoute {
  const OrderPageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const OrderScreen();
}

class ChatBranchData extends StatefulShellBranchData {
  const ChatBranchData();
}

class ChatPageRoute extends GoRouteData with $ChatPageRoute {
  const ChatPageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const ChatScreen();
}

class ProfileBranchData extends StatefulShellBranchData {
  const ProfileBranchData();
}

class ProfilePageRoute extends GoRouteData with $ProfilePageRoute {
  const ProfilePageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const ProfileScreen();
}

@TypedStatefulShellRoute<AppShellRouteData>(
  branches: [
    TypedStatefulShellBranch<HomeBranchData>(
      routes: [TypedGoRoute<HomeRoute>(path: '/home')],
    ),
    TypedStatefulShellBranch<GroupOrderBranchData>(
      routes: [TypedGoRoute<GroupOrderPageRoute>(path: '/group-order')],
    ),
    TypedStatefulShellBranch<OrderBranchData>(
      routes: [TypedGoRoute<OrderPageRoute>(path: '/order')],
    ),
    TypedStatefulShellBranch<ChatBranchData>(
      routes: [TypedGoRoute<ChatPageRoute>(path: '/chat')],
    ),
    TypedStatefulShellBranch<ProfileBranchData>(
      routes: [TypedGoRoute<ProfilePageRoute>(path: '/profile')],
    ),
  ],
)
class AppShellRouteData extends StatefulShellRouteData {
  const AppShellRouteData();

  @override
  Widget builder(
    BuildContext context,
    GoRouterState state,
    StatefulNavigationShell navigationShell,
  ) {
    return ScaffoldWithBottomNavBar(navigationShell: navigationShell);
  }
}

class ScaffoldWithBottomNavBar extends StatelessWidget {
  const ScaffoldWithBottomNavBar({
    required this.navigationShell,
    super.key,
  });

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navigationShell.currentIndex,
        onTap: (index) => navigationShell.goBranch(index),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.kBlazeOrange500,
        selectedLabelStyle: appTextTheme.titleSmall?.copyWith(
          fontFamily: 'Supreme',
          fontWeight: FontWeight.w500,
          color: AppColors.kBlazeOrange500,
        ),
        unselectedLabelStyle: appTextTheme.titleSmall?.copyWith(
          fontFamily: 'Supreme',
          color: AppColors.kCarbonBlack900,
        ),
        backgroundColor: AppColors.kWhite,

        elevation: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              color: AppColors.kCarbonBlack900,
              size: 32,
            ),
            label: 'Home',
            activeIcon: Icon(
              Icons.home_outlined,
              color: AppColors.kBlazeOrange500,
              size: 32,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.group_outlined,
              color: AppColors.kCarbonBlack900,
              size: 32,
            ),
            label: 'Group Order',
            activeIcon: Icon(
              Icons.group_outlined,
              color: AppColors.kBlazeOrange500,
              size: 32,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_cart_outlined,
              color: AppColors.kCarbonBlack900,
              size: 32,
            ),
            label: 'Order',
            activeIcon: Icon(
              Icons.shopping_cart_outlined,
              color: AppColors.kBlazeOrange500,
              size: 32,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.message_outlined,
              color: AppColors.kCarbonBlack900,
              size: 32,
            ),
            label: 'Chat',
            activeIcon: Icon(
              Icons.message_outlined,
              color: AppColors.kBlazeOrange500,
              size: 32,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outline,
              color: AppColors.kCarbonBlack900,
              size: 32,
            ),
            label: 'Profile',
            activeIcon: Icon(
              Icons.person_outline,
              color: AppColors.kBlazeOrange500,
              size: 32,
            ),
          ),
        ],
      ),
    );
  }
}
