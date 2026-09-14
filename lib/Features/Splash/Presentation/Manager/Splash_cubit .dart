import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:parkingapp/Features/Splash/Presentation/Manager/Splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashLoadingState()) {
    checkUser();
  }

  Future<void> checkUser() async {
    try {
      await Future.delayed(const Duration(seconds:3));

      final Box box = Hive.box("UserFirstLogin");
      final isFirstTime = box.get("isFirstTime", defaultValue: true);
      final hasAccount = box.get("hasAccount", defaultValue: false);
      final user = FirebaseAuth.instance.currentUser;

      if (isFirstTime) {
         emit(SplashFirstTimeState());
      } 
       else if (user != null) {
        emit(SplashLoggedInState());
      }
       else if (hasAccount) {
        emit(SplashLoggedOutState());
      }
        else {
        emit(SplashNeedsSignupState());
      }
    } catch (e) {
      emit(SplashErrorState(e.toString()));
    }
  }
}