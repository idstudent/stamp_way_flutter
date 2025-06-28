import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stamp_way_flutter/model/saved_location.dart';

final loginProvider = NotifierProvider<LoginProvider, Map<String, dynamic>?>(LoginProvider.new);

class LoginProvider extends Notifier<Map<String, dynamic>?> {
  final _auth = FirebaseAuth.instance;
  final _fireStore = FirebaseFirestore.instance;

  @override
  Map<String, dynamic>? build() {
    getUser();
    return null;
  }

  Future<(bool, String?)> signIn(String email, String password) async {
    try  {
      final auth = await _auth.signInWithEmailAndPassword(
          email: email,
          password: password
      );

      if(auth.user?.emailVerified == true) {
        getUser();
        return(true, null);
      } else {
        await _auth.signOut();
        return (false, '이메일 인증이 필요합니다. 이메일을 확인해주세요.');
      }
    } on FirebaseAuthException catch (e) {
      String errorMessage;
      switch (e.code) {
        case 'invalid-credential':
          errorMessage = "이메일 또는 비밀번호가 일치하지 않습니다";
          break;
        case 'user-not-found':
          errorMessage = "존재하지 않는 계정입니다";
          break;
        default:
          errorMessage = "로그인에 실패했습니다";
      }
      return (false, errorMessage);
    }
  }
  Future<void> logout() async {
    await _auth.signOut();
    state = null;
  }

  Future<Map<String, dynamic>?> getUser() async {
    final user = _auth.currentUser;
    if(user == null) {
      state = null;
      return null;
    }
    try {
      final doc = await _fireStore.collection('users').doc(user.uid).get();
      final userInfo = doc.data();

      state = userInfo;
      return userInfo;
    } catch (e) {
      print('error $e');
      return null;
    }
  }
}

