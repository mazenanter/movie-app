import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/core/utils/app_router.dart';
import 'package:movie_app/features/splash/presentation/views/widgets/animated_text.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> slidingAnimation;
  @override
  void initState() {
    super.initState();
    initSlidingAnimation();
    //navigateToHome();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const CustomAnimatedText();
  }

  void initSlidingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    )..addStatusListener(
        (status) {
          if (status == AnimationStatus.completed) {
            navigateToHome();
            Timer(
              const Duration(milliseconds: 300),
              () {
                animationController.reset();
              },
            );
          }
        },
      );
    slidingAnimation =
        Tween<double>(begin: 0.0, end: 12).animate(animationController);
    Timer(
        const Duration(
          seconds: 2,
        ), () {
      setState(() {
        animationController.forward();
      });
    });
  }

  void navigateToHome() {
    Future.delayed(
      const Duration(seconds: 1),
      () {
        GoRouter.of(context).push(AppRouter.kHomeiew);
      },
    );
  }
}
