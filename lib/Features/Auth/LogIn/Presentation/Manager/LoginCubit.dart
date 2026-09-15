import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hive/hive.dart';
import 'package:parkingapp/Core/model/User_Model.dart';
import 'package:parkingapp/Features/Auth/LogIn/Presentation/Manager/LoginState.dart';
import 'package:parkingapp/Features/Auth/LogIn/data/LogiIn_hive.dart';

class Logincubit extends Cubit<Loginstate> {
  Logincubit() : super(LoginInitialState());

  LogiinHive loginHive = LogiinHive();

  final GoogleSignIn googleSignIn = GoogleSignIn.instance;
  bool googleSignInInitialized = false;

  Future<void> _ensureGoogleSignInInitialized() async {
    if (!googleSignInInitialized) {
      await googleSignIn.initialize(
        serverClientId: 'YOUR_WEB_CLIENT_ID.apps.googleusercontent.com',
      );
      googleSignInInitialized = true;
    }
  }

  Future<void> UserLogIn(String email, String password) async {
    if (!email.contains("@") && !email.contains(".")) {
      emit(LoginErrorState("Please enter a valid email"));
      return;
    }
    if (email.isEmpty || password.isEmpty) {
      emit(LoginErrorState("Please fill all fields"));
      return;
    }
    emit(LoginLoadingState());
    try {
      UserCredential credentialLogin =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final uid = credentialLogin.user!.uid;
      DocumentSnapshot userDoc =
          await FirebaseFirestore.instance.collection("user").doc(uid).get();
      if (!userDoc.exists) {
        emit(LoginErrorState("User data not found"));
        return;
      }
      Map<String, dynamic> userData = userDoc.data() as Map<String, dynamic>;
      UserModel user = UserModel.fromJson(userData);

      loginHive.UserLogin(email, password);
      Hive.box("UserFirstLogin").put("hasAccount", true);

      emit(LoginSuccessState(user));
    } catch (e) {
      emit(LoginErrorState(e.toString()));
    }
  }

  Future<void> GoogleLogin() async {
    emit(LoginLoadingState());

    try {
      await _ensureGoogleSignInInitialized();

      final GoogleSignInAccount googleUser =
          await googleSignIn.authenticate();

      final GoogleSignInAuthentication googleAuth =
          googleUser.authentication;

      if (googleAuth.idToken == null) {
        emit(LoginErrorState("Failed to get Google ID token"));
        return;
      }

      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );

      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      final user = userCredential.user!;

      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection("user")
          .doc(user.uid)
          .get();

      Map<String, dynamic> userData;
      if (!userDoc.exists) {
        userData = {
          "name": user.displayName,
          "email": user.email,
          "phone": user.phoneNumber,
          "uid": user.uid,
        };
        await FirebaseFirestore.instance
            .collection("user")
            .doc(user.uid)
            .set(userData);
      } else {
        userData = userDoc.data() as Map<String, dynamic>;
      }

      UserModel userGoogle = UserModel.fromJson(userData);

      Hive.box("UserFirstLogin").put("hasAccount", true);

      emit(LoginSuccessState(userGoogle));
    } on GoogleSignInException catch (e) {
      if (e.code == GoogleSignInExceptionCode.canceled) {
        emit(LoginInitialState());
      } else {
        emit(LoginErrorState(e.description ?? "Google sign-in failed"));
      }
    } catch (e) {
      emit(LoginErrorState(e.toString()));
    }
  }

  Future<void> LogOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      loginHive.deleteUser();
      emit(LoginInitialState());
    } catch (e) {
      emit(LoginErrorState("Logout failed"));
    }
  }

  void checkLogin() {
    var email = loginHive.getEmail();
    var password = loginHive.getPassword();

    if (email != null && password != null) {
      emit(LoginLoadingState());
    } else {
      emit(LoginInitialState());
    }
  }
}