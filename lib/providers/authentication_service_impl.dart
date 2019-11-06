import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_go_club_app/preferencias_usuario/user_preferences.dart';

import 'abstract_service_pendent/user_service.dart';

class AuthenticationServiceImpl {



  static AuthenticationServiceImpl _instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _prefs = new UserPreferences();
  final _userService = new UserService();

  AuthenticationServiceImpl._internal();

  static AuthenticationServiceImpl getState() {
    if (_instance == null) {
      _instance = AuthenticationServiceImpl._internal();
    }

    return _instance;
  }

  Future<FirebaseUser> logIn(String email, String password) async {
    FirebaseUser firebaseUser = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return firebaseUser;
  }

  Future<FirebaseUser> registerFirebase(String email, String password) async {
    FirebaseUser createUserWithEmailAndPassword = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password
    );
    return createUserWithEmailAndPassword;
  }
  Future<FirebaseUser> getCurrentUser() async {
    FirebaseUser user = await _auth.currentUser();
    return user;
  }

  Future<void> signOut() async {
    return _auth.signOut();
  }

  Future<void> sendEmailVerification() async {
    FirebaseUser user = await _auth.currentUser();
    user.sendEmailVerification();
  }

  Future<bool> isEmailVerified() async {
    FirebaseUser user = await _auth.currentUser();
    return user.isEmailVerified;
  }
}
