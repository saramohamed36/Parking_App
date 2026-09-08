import 'package:go_router/go_router.dart';
import 'package:parkingapp/Core/Routing/Routes.dart';
import 'package:parkingapp/Features/Splash/SplashScreen.dart';
import 'package:parkingapp/Features/onBoarding/onBoardingScreen.dart';

class AppRouter {
  static List<GoRoute> routes = [
    GoRoute(
      path: Routes.splashScreen,
      builder: (context, state) => const Splashscreen(),
    ),
    GoRoute(
      path: Routes.onBoardeingScreen,
      builder: (context, state) => const Onboardingscreen(),
    ),
  ];
  static GoRouter router = GoRouter(routes: routes);
}
