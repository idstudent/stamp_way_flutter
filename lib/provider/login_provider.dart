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

      getUser();
      return(true, null);
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

  Future<(bool, String?)> signUp(String email, String password, String nickName) async {
    UserCredential? userCredential;

    try {
      final nickNameCheck = await _fireStore
          .collection('users')
          .where('nickname', isEqualTo: nickName)
          .get();

      if(nickNameCheck.docs.isNotEmpty) {
        return (false, '이미 사용중인 닉네임이에요');
      }

      userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);

      final user = {
        'uid': userCredential.user!.uid,
        'email': email,
        'nickname': nickName,
        'createdAt': FieldValue.serverTimestamp(),
      };

      await _fireStore
          .collection('users')
          .doc(userCredential.user!.uid)
          .set(user);

      await _auth.signOut();

      return (true, null);
    } on FirebaseAuthException catch (e) {
      String errorMessage;
      switch (e.code) {
        case 'weak-password':
          errorMessage = '비밀번호는 6자 이상이어야 합니다';
          break;
        case 'invalid-email':
          errorMessage = '잘못된 이메일 형식입니다';
          break;
        case 'email-already-in-use':
          errorMessage = '이미 사용 중인 이메일입니다';
          break;
        default:
          errorMessage = e.message ?? '알 수 없는 오류가 발생했습니다';
      }

      if (userCredential?.user != null) {
        await userCredential!.user!.delete();
      }

      return (false, errorMessage);
    } catch (e) {
      return (false, '회원가입 중 오류가 발생했어요: ${e.toString()}');
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

