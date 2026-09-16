// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// import 'ProfileState.dart';

// class ProfileCubit extends Cubit<ProfileState> {
//   ProfileCubit() : super(ProfileInitialState());

//   Future<void> getUserData() async {
//     emit(ProfileLoadingState());

//     try {
//       await Future.delayed(const Duration(milliseconds: 300));

//       User? user = FirebaseAuth.instance.currentUser;

//       if (user == null) {
//         emit(ProfileErrorState(errorMessage: "No user logged in"));
//         return;
//       }

//       DocumentSnapshot doc = await FirebaseFirestore.instance
//           .collection('user')
//           .doc(user.uid)
//           .get();

//       if (doc.exists && doc.data() != null) {
//         Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

//         String name = data['name'] ?? user.displayName ?? 'User';
//         String email = data['email'] ?? user.email ?? '';

//         emit(ProfileSuccessState(name: name, email: email));
//       } else {
//         emit(
//           ProfileSuccessState(
//             name: user.displayName ?? 'User',
//             email: user.email ?? '',
//           ),
//         );
//       }
//     } catch (e) {
//       emit(ProfileErrorState(errorMessage: e.toString()));
//     }
//   }
// }

import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'ProfileState.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitialState());

  StreamSubscription? _authSubscription;
  StreamSubscription? _docSubscription;

  void getUserData() {
    emit(ProfileLoadingState());

    _authSubscription?.cancel();
    _docSubscription?.cancel();

    _authSubscription = FirebaseAuth.instance.authStateChanges().listen((
      currentUser,
    ) {
      if (currentUser == null) {
        emit(ProfileErrorState(errorMessage: "No user logged in"));
        return;
      }

      _docSubscription?.cancel();

      _docSubscription = FirebaseFirestore.instance
          .collection('user')
          .doc(currentUser.uid)
          .snapshots(includeMetadataChanges: false)
          .listen(
            (documentSnapshot) {
              if (documentSnapshot.exists && documentSnapshot.data() != null) {
                var userData = documentSnapshot.data() as Map<String, dynamic>;

                String name =
                    userData['name'] ?? currentUser.displayName ?? 'User';
                String email = userData['email'] ?? currentUser.email ?? '';

                emit(ProfileSuccessState(name: name, email: email));
              } else {
                emit(
                  ProfileSuccessState(
                    name: currentUser.displayName ?? 'User',
                    email: currentUser.email ?? '',
                  ),
                );
              }
            },
            onError: (error) {
              emit(ProfileErrorState(errorMessage: error.toString()));
            },
          );
    });
  }

  @override
  Future<void> close() {
    _authSubscription?.cancel();
    _docSubscription?.cancel();
    return super.close();
  }

  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }
}
