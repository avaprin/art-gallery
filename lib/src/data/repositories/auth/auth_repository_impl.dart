import 'package:firebase_auth/firebase_auth.dart' as fir;
import 'package:google_sign_in/google_sign_in.dart';

import '../../models/user/user.dart';
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

  @override
  Future<User> fetchUser() async {
    final fir.User? firUser = _firebaseAuth.currentUser;

    if (firUser == null) {
      throw Exception('Failed to fetch user, already signed out');
    }

    return User(
      id: firUser.uid,
      name: firUser.displayName,
      email: firUser.email,
      imageUrl: firUser.photoURL,
      creationDateTime: firUser.metadata.creationTime,
      lastSignInDateTime: firUser.metadata.lastSignInTime,
    );
  }

  @override
  Future<void> signOut() async {
    await _googleSignIn.signOut();
    await _firebaseAuth.signOut();
  }
}
