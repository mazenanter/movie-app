import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/features/home/presentasion/views/home_view.dart';
import 'package:movie_app/features/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const kHomeiew = '/homeView';
  static const kHomeDetailsView = '/homeView';
  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const SplashView();
        },
      ),
      GoRoute(
        path: kHomeiew,
        builder: (BuildContext context, GoRouterState state) {
          return const HomeView();
        },
      ),
    ],
  );
}
