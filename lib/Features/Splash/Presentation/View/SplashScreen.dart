import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:parkingapp/Core/Routing/Routes.dart';
import 'package:parkingapp/Core/Theme/AppAssets.dart';
import 'package:parkingapp/Core/Theme/ColorManager.dart';
import 'package:parkingapp/Features/Auth/LogIn/Presentation/View/LoginScreen.dart';

import 'package:parkingapp/Features/Splash/Presentation/Manager/Splash_cubit%20.dart';
import 'package:parkingapp/Features/Splash/Presentation/Manager/Splash_state.dart';

class Splashscreen extends StatelessWidget {
  static const String routName = "/Splashscreen";
  const Splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
      listener: (context, state) {
        // TODO: implement listener
          if (state is SplashFirstTimeState) {
          context.go(Routes.OnboardingScreen);
        }

        if (state is SplashLoggedInState) {
          context.go(Routes.Garageoverviewscreen);
        }

        if (state is SplashLoggedOutState) {
          context.go(Routes.loginScrren);
        }

        if (state is SplashNeedsSignupState) {
          context.go(Routes.signupScreen);
        }

        if (state is SplashErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Make mistacke : ${state.message}")),
          );
        }
      
      },
      child: Scaffold(
        backgroundColor: ColorManager.primaryBG,
        body: Center(child: Image.asset(Appassets.logoImage)),
      ),
    );
  }
}
