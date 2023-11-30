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
// TODO: Add Onboarding Route
// TODO: Add Home Route
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
      }
// TODO: Add Redirect Handler
      );
}
