import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  // ─── EMAIL AUTH ───────────────────────────────────────────

  Future<User?> signUpWithEmail(
    String email,
    String password,
    String name,
  ) async {
    try {
      final UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(
            email: email.trim(),
            password: password.trim(),
          );
      // Save the name to Firebase profile
      await userCredential.user?.updateDisplayName(name.trim());
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      debugPrint('SignUp error: ${e.message}');
      rethrow;
    }
  }

  Future<User?> signInWithEmail(String email, String password) async {
    try {
      final UserCredential userCredential = await _auth
          .signInWithEmailAndPassword(
            email: email.trim(),
            password: password.trim(),
          );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      debugPrint('SignIn error: ${e.message}');
      rethrow;
    }
  }

  // ─── GOOGLE AUTH ──────────────────────────────────────────

  Future<User?> signInWithGoogle() async {
    try {
      // Web uses a different flow
      if (kIsWeb) {
        final GoogleAuthProvider googleProvider = GoogleAuthProvider();
        await _auth.signInWithRedirect(googleProvider);
        final UserCredential userCredential = await _auth.getRedirectResult();
        return userCredential.user;
      }

      // Android + iOS flow
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return null;

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential = await _auth.signInWithCredential(
        credential,
      );
      return userCredential.user;
    } catch (e) {
      debugPrint('Google Sign-In error: $e');
      return null;
    }
  }

  // ─── SIGN OUT ─────────────────────────────────────────────

  Future<void> signOut() async {
    if (!kIsWeb) await _googleSignIn.signOut();
    await _auth.signOut();
  }

  // ─── CURRENT USER ─────────────────────────────────────────

  User? get currentUser => _auth.currentUser;
}
