
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/auth/views/pages/signup_page.dart';
import '../../features/auth/views/pages/splash_page.dart';

/// The route configuration.
final _parentKey = GlobalKey<NavigatorState>();
final _shellKey = GlobalKey<NavigatorState>();
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
      path: NamedRoutes.signup,
      builder: (BuildContext context, GoRouterState state) {
        return const SignupPage();
      },
    ),
    // ShellRoute(
    //   navigatorKey: _shellKey,
    //   pageBuilder: (BuildContext context, GoRouterState state, child) {
    //     return NoTransitionPage(
    //         child: MainPage(
    //       currentPage: child,
    //       currentRoute: state.uri.path,
    //     ));
    //   },
    //   routes: [
    //     GoRoute(
    //       parentNavigatorKey: _shellKey,
    //       path: NamedRoutes.home,
    //       pageBuilder: (BuildContext context, GoRouterState state) {
    //         return const NoTransitionPage(child: HomePage());
    //       },
    //     ),
    //     GoRoute(
    //       parentNavigatorKey: _shellKey,
    //       path: NamedRoutes.appointments,
    //       pageBuilder: (BuildContext context, GoRouterState state) {
    //         return const NoTransitionPage(child: AppointmentsPage());
    //       },
    //     ),
    //     GoRoute(
    //       parentNavigatorKey: _shellKey,
    //       path: NamedRoutes.patients,
    //       pageBuilder: (BuildContext context, GoRouterState state) {
    //         return const NoTransitionPage(child: PatientsPage());
    //       },
    //     ),
    //     GoRoute(
    //       parentNavigatorKey: _shellKey,
    //       path: NamedRoutes.menu,
    //       pageBuilder: (BuildContext context, GoRouterState state) {
    //         return const NoTransitionPage(child: MenuPage());
    //       },
    //     ),
    //   ],
    // ),
  ],
);

class NamedRoutes {
  static const String base = '/';
  static const String signup = '/signup';
  static const String home = '/home';
}
