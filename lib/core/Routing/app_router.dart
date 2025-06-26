
import 'package:flutter/material.dart';
import 'package:untitled/core/Routing/routes.dart';

import '../../features/presentation/view/widgets/home_Page.dart';
import '../../features/presentation/view/widgets/splssh_screen.dart';
import '../../onboarding.dart';


class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case Routes.SplsshScreen:
        return _createRoute(SplsshScreen());
      case Routes.HomePage:
        return _createRoute(HomePage());
      case Routes.OnboardingPage:
        return _createRoute(OnboardingPage());
      default:
        return MaterialPageRoute(
          settings: settings,
          builder:
              (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }

  PageRouteBuilder _createRoute(Widget page) {
    return PageRouteBuilder(
      transitionDuration: Duration(milliseconds: 350),
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(opacity: animation, child: child);
      },
    );
  }
}