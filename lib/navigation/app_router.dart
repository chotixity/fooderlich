import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../screens/screens.dart';
import '../models/models.dart';

class AppRouter {
  final AppStateManager appStateManager;
  final ProfileManager profileManager;
  final GroceryManager groceryManager;

  AppRouter(this.appStateManager, this.profileManager, this.groceryManager);

  late final router = GoRouter(
    refreshListenable: appStateManager,
    debugLogDiagnostics: true,
    initialLocation: '/login',
    routes: [
      // TODO: Add Login Route
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => const LoginScreen(),
      ),
// TODO: Add Onboarding Route
      GoRoute(
        name: 'onboarding',
        path: '/onboarding',
        builder: (context, state) => const OnboardingScreen(),
      ),
// TODO: Add Home Route
      GoRoute(
        path: '/home',
        builder: (BuildContext context, GoRouterState state) =>
            Home(currentTab: appStateManager.getSelectedTab),
      ),
    ],
    // TODO: Add Error Handler
    errorPageBuilder: (context, state) {
      return MaterialPage(
        key: state.pageKey,
        child: Scaffold(
          body: Center(
            child: Text(state.error.toString()),
          ),
        ),
      );
    },
// TODO: Add Redirect Handler
    redirect: (context, state) {
// 1
      final loggedIn = appStateManager.isLoggedIn;
// 2
      final loggingIn = state.matchedLocation == '/login';
// 3
      if (!loggedIn) return loggingIn ? null : '/login';
// 4
      final isOnboardingComplete = appStateManager.isOnboardingComplete;
// 5
      final onboarding = state.matchedLocation == '/onboarding';
// 6
      if (!isOnboardingComplete) {
        return onboarding ? null : '/onboarding';
      }
// 7
      if (loggingIn || onboarding) return '/${FooderlichTab.explore}';
// 8
      return null;
    },
  );
}
