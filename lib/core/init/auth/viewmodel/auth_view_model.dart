import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:oradayim/core/base/viewmodels/base_view_model.dart';

class AuthViewModel extends BaseViewModel{
  User? user;
  StreamSubscription<User?>? _authStateSubscription;

  @override
  FutureOr<void> init() {
    listenToAuthStateChanges();
  }

  void listenToAuthStateChanges() {
    _authStateSubscription = FirebaseAuth.instance.authStateChanges().listen((User? user) {
     if(!isDisposed){
       this.user = user;
       reloadState();
     }
    });
  }

  @override
  void dispose() {
    _authStateSubscription?.cancel();
    super.dispose();
  }
}