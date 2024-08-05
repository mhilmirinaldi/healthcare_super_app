import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:super_app_telemedicine/data/repository/authentication.dart';
import 'package:super_app_telemedicine/domain/entity/result.dart';

import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

class FirebaseAuthentication implements Authentication {
  final firebase_auth.FirebaseAuth _firebaseAuth;

  FirebaseAuthentication({firebase_auth.FirebaseAuth? firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? firebase_auth.FirebaseAuth.instance;

  @override
  String? getLoggedInUserId() => _firebaseAuth.currentUser?.uid;

  @override
  Future<Result<String>> login(
      {required String email, required String password}) async {
    try {
      var userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Result.success(userCredential.user!.uid);
    } on firebase_auth.FirebaseAuthException catch (e) {
      return Result.failed(e.message!);
    }
  }

  @override
  Future<Result<void>> logout() async {
    await _firebaseAuth.signOut();

    if (_firebaseAuth.currentUser == null) {
      return const Result.success(null);
    } else {
      return const Result.failed('Failed to logout');
    }
  }

  @override
  Future<Result<String>> register(
      {required String email, required String password}) async {
    try {
      var userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Result.success(userCredential.user!.uid);
    } on firebase_auth.FirebaseAuthException catch (e) {
      return Result.failed('${e.message}');
    }
  }

  @override
  Future<Result<void>> resetPassword({required String email}) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
      // check if email is registered
      final CollectionReference users =
          FirebaseFirestore.instance.collection('users');

      final QuerySnapshot result =
          await users.where('email', isEqualTo: email).limit(1).get();

      if (result.docs.isEmpty) {
        return const Result.failed('Email is not registered');
      }

      
      return const Result.failed('Reset password email sent');
    } on firebase_auth.FirebaseAuthException catch (e) {
      return Result.failed(e.message!);
    }
  }

  @override
  Future<Result<void>> changePassword(
      {required String email,
      required String currentPassword,
      required String newPassword}) async {
    try {
      var userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: currentPassword,
      );

      await userCredential.user!.updatePassword(newPassword);

      return const Result.failed('Password changed successfully');
    } on firebase_auth.FirebaseAuthException {
      return const Result.failed('Your current password is incorrect');
    }
  }
}
