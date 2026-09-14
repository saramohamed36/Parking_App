import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:parkingapp/Core/Routing/Routes.dart';
import 'package:parkingapp/Features/Auth/LogIn/Presentation/Manager/LoginCubit.dart';
import 'package:parkingapp/Features/Auth/LogIn/Presentation/View/LoginScreen.dart';
import 'package:parkingapp/Features/Auth/SignUp/Presentation/Manager/SignupCubit.dart';
import 'package:parkingapp/Features/Auth/SignUp/Presentation/View/SignupScreen.dart';
import 'package:parkingapp/Features/Home/Presentation/View/GarageOverviewScreen.dart';
import 'package:parkingapp/Features/Splash/Presentation/Manager/Splash_cubit%20.dart';
import 'package:parkingapp/Features/Splash/Presentation/View/SplashScreen.dart';
import 'package:parkingapp/Features/onBoarding/onBoardingScreen.dart';

class AppRouter {
  static List<GoRoute> routes = [
    GoRoute(
      path: Routes.splashScreen,
      builder: (context, state) => BlocProvider(
        create: (context) => SplashCubit(),
        child: const Splashscreen(),
      ),
    ),
    GoRoute(
      path: Routes.OnboardingScreen,
      builder: (context, state) => const OnboardingScreen(),
    ),
    GoRoute(
      path: Routes.signupScreen,
      builder: (context, state) => BlocProvider(
        create: (context) => Signupcubit(),
        child: SignupScreen(),
      ),
    ),
    GoRoute(
      path: Routes.loginScrren,
      builder: (context, state) =>
          BlocProvider(create: (context) => Logincubit(), 
          child: Loginscreen()),
    ),
    GoRoute(
      path: Routes.Garageoverviewscreen,
      builder: (context, state) => Garageoverviewscreen(),
    ),
  ];
  static GoRouter router = GoRouter(
    routes: routes,
    initialLocation: Routes.splashScreen,
  );
}
