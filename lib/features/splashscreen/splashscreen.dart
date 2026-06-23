import 'package:chop_gang/core/router/app_router.dart';
import 'package:chop_gang/core/variables/app_svgs.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _offsetAnimation;
  late final Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    // single controller driving a staggered animation
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 5000),
    );

    // slide in during the first 35% of the timeline
    _offsetAnimation =
        Tween<Offset>(
          begin: const Offset(0, 10),
          end: Offset.zero,
        ).animate(
          CurvedAnimation(
            parent: _controller,
            curve: const Interval(0, 0.35, curve: Curves.easeOut),
          ),
        );

    // after slide completes, run a scale-in then scale-out sequence
    _scaleAnimation =
        TweenSequence<double>(
          [
            TweenSequenceItem(
              tween: Tween(
                begin: 0.8,
                end: 1.50,
              ).chain(CurveTween(curve: Curves.easeOut)),
              weight: 50,
            ),
            TweenSequenceItem(
              tween: Tween(
                begin: 1.50,
                end: 0.8,
              ).chain(CurveTween(curve: Curves.easeIn)),
              weight: 50,
            ),
          ],
        ).animate(
          CurvedAnimation(
            parent: _controller,
            curve: const Interval(0.35, 1),
          ),
        );

    _controller.forward();

    if (mounted) {
      Future.delayed(const Duration(milliseconds: 6000), () {
        OnboardingScreenRoute().go(context);
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xffF4C944),
            Color(0xffF3E8CC),
            Color(0xffF4C944),
          ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SlideTransition(
              position: _offsetAnimation,
              child: ScaleTransition(
                scale: _scaleAnimation,
                child: ClipRRect(
                  child: SvgPicture.asset(
                    AppSvgs.logo,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
