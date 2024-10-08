import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';
import 'package:super_app_telemedicine/data/repository/user_repository.dart';
import 'package:super_app_telemedicine/domain/entity/result.dart';
import 'package:super_app_telemedicine/domain/entity/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseUserRepository implements UserRepository{
  final FirebaseFirestore _firebaseFirestore;

  FirebaseUserRepository({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;
    
  @override
  Future<Result<User>> createUser({required String id, required String email, required String name, String? photoUrl}) async {
    CollectionReference<Map<String, dynamic>> documentReference = _firebaseFirestore.collection('users');

    await documentReference.doc(id).set({
      'id': id,
      'email': email,
      'name': name,
      'photoUrl': photoUrl,
    });

    DocumentSnapshot<Map<String, dynamic>> result = await documentReference.doc(id).get();

    if(result.exists){
      return Result.success(User.fromJson(result.data()!));
    } else {
      return const Result.failed('Failed to create user');
    }

  }

  @override
  Future<Result<String>> getName({required String id}) async {
    DocumentReference<Map<String, dynamic>> documentReference = _firebaseFirestore.doc('users/$id');
    DocumentSnapshot<Map<String, dynamic>> result = await documentReference.get();

    if (result.exists) {
      return Result.success(result.data()!['name']);
    } else {
      return const Result.failed('User not found');
    }
  }

  @override
  Future<Result<User>> getUser({required String id}) async {
    DocumentReference<Map<String, dynamic>> documentReference = _firebaseFirestore.doc('users/$id');
    DocumentSnapshot<Map<String, dynamic>> result = await documentReference.get();

    if (result.exists) {
      return Result.success(User.fromJson(result.data()!));
    } else{
      return const Result.failed('User not found');
    }
  }

  @override
  Future<Result<User>> updateUser({required User user}) async {
    try {
      DocumentReference<Map<String, dynamic>> documentReference = _firebaseFirestore.doc('users/${user.id}');
      await documentReference.update(user.toJson());

      DocumentSnapshot<Map<String, dynamic>> result = await documentReference.get();

      if (result.exists) {
        User updatedUser = User.fromJson(result.data()!);
        if (updatedUser == user) {
          return Result.success(updatedUser);
        } else {
          return const Result.failed('Failed to update user');
        }
      } else {
        return const Result.failed('Failed to update user');
      }
      
    } on FirebaseException catch (e) {
      return Result.failed(e.message ?? 'Failed to update user');
    }
  }

  @override
  Future<Result<User>> uploadProfilePicture({required User user, required File imageFile}) async {
    String filename = basename(imageFile.path);

    Reference reference = FirebaseStorage.instance.ref().child(filename);

    try {
      await reference.putFile(imageFile);

      String downloadUrl = await reference.getDownloadURL();

      var updateResult = await updateUser(user: user.copyWith(photoUrl: downloadUrl));

      if (updateResult.isSuccess) {
        return Result.success(updateResult.resultValue!);
      } else {
        return Result.failed(updateResult.errorMessage!);
      }
    } catch (e) {
      return const Result.failed('Failed to upload profile picture'); 
    }
  }

}