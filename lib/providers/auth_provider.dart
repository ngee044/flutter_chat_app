import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';

// Firebase Auth status managing StateNotifier
class AuthNotifier extends StateNotifier<User?> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  AuthNotifier() : super(FirebaseAuth.instance.currentUser) {
    _auth.authStateChanges().listen((User? user) {
      state = user;
    });
  }

  // Sign in with email and password
  Future<void> signIn(String email, String password) async {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
    // 로그인 성공 시 상태(state)에 자동으로 사용자 정보가 반영됩니다.
    // (authStateChanges 리스너에 의해 state 업데이트)
    // TODO
    // 실패 시 에러 처리 (예: 잘못된 로그인 정보 안내)
  }

  Future<void> signUp(String email, String password) async {
    await _auth.createUserWithEmailAndPassword(email: email, password: password);
    // 회원가입 성공 시 FirebaseAuth가 자동으로 해당 계정으로 로그인합니다.
    // authStateChanges 리스너에 의해 state가 신규 사용자로 업데이트됩니다.
    // TODO
    // 회원가입 후 Firestore에 사용자 프로필 정보 저장 (예: 닉네임, 가입일 등)
  }

  // Sign out
  Future<void> signOut() async {
    await _auth.signOut();
  }
}

final authProvider = StateNotifierProvider<AuthNotifier, User?>((ref) {
  return AuthNotifier();
});
