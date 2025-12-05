
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:workiom/features/auth/views/pages/auth_page.dart';
import 'package:workiom/features/auth/views/pages/create_workspace_page.dart';
import '../../features/auth/views/pages/signup_page.dart';
import '../../features/auth/views/pages/splash_page.dart';
import 'named_routes.dart';

/// The route configuration.
final _parentKey = GlobalKey<NavigatorState>();
final GoRouter goRouter = GoRouter(
  navigatorKey: _parentKey,
  routes: <RouteBase>[
    GoRoute(
      parentNavigatorKey: _parentKey,
      path: NamedRoutes.base,
      builder: (BuildContext context, GoRouterState state) {
        return const SplashPage();
      },
    ),
    GoRoute(
      parentNavigatorKey: _parentKey,
      path: NamedRoutes.auth,
      builder: (BuildContext context, GoRouterState state) {
        return const AuthPage();
      },
    ),
    GoRoute(
      parentNavigatorKey: _parentKey,
      path: NamedRoutes.signup,
      builder: (BuildContext context, GoRouterState state) {
        return const SignupPage();
      },
    ),
    GoRoute(
      parentNavigatorKey: _parentKey,
      path: NamedRoutes.createWorkspace,
      builder: (BuildContext context, GoRouterState state) {
        return const CreateWorkspacePage();
      },
    ),
  ],
);
