import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

ValueNotifier<AuthServices> authService = ValueNotifier(AuthServices());

class AuthServices {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  User? get currentUser => firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => firebaseAuth.authStateChanges();

  Future<UserCredential> signIn({
    required String email,
    required String password,
  }) async {
    return await firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<UserCredential> createAccount({
    required String email,
    required String password,
    // required String name, // add name
  }) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      // Save user info to Firestore
      await registerUser(
        userCredential.user!.uid, email,
        // name
      );

      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  Future<void> registerUser(
    String uid,
    String email,
    // String name
  ) async {
    await firestore.collection('Users').doc(uid).set({
      'uuid': uid,
      'email': email,
      // 'name': name, // optional
      // 'createdAt': FieldValue.serverTimestamp(),
    });
  }

  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }

  Future<void> resetPassword({required String email}) async {
    await firebaseAuth.sendPasswordResetEmail(email: email);
  }

  Future<void> updateUsername({required String username}) async {
    await currentUser!.updateDisplayName(username);
  }

  Future<void> deleteAccount({
    required String email,
    required String password,
  }) async {
    AuthCredential credential = EmailAuthProvider.credential(
      email: email,
      password: password,
    );
    await currentUser!.reauthenticateWithCredential(credential);
    await currentUser!.delete();
    await firebaseAuth.signOut();
  }

  Future<void> resetPasswordFromCurrentPassword({
    required String currentPassword,
    required String newPassword,
    required String email,
  }) async {
    AuthCredential credential = EmailAuthProvider.credential(
      email: email,
      password: currentPassword,
    );
    await currentUser!.reauthenticateWithCredential(credential);
    await currentUser!.updatePassword(newPassword);
  }
}
