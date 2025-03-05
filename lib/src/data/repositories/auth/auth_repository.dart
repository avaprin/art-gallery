abstract interface class AuthRepository {
  Future<void> signInWithGoogle();

  Future<bool> isSignedIn();
}
