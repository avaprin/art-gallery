import 'package:firebase_auth/firebase_auth.dart' as fir;
import 'package:google_sign_in/google_sign_in.dart';

import 'auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final fir.FirebaseAuth _firebaseAuth = fir.FirebaseAuth.instance;

  @override
  Future<void> signInWithGoogle() async {
    final GoogleSignInAccount? googleAccount = await _googleSignIn.signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleAccount?.authentication;

    final fir.OAuthCredential googleCredential =
        fir.GoogleAuthProvider.credential(
      idToken: googleAuth?.idToken,
      accessToken: googleAuth?.accessToken,
    );

    await _firebaseAuth.signInWithCredential(
      googleCredential,
    );
  }

  @override
  Future<bool> isSignedIn() async {
    return _firebaseAuth.currentUser != null;
  }
}
