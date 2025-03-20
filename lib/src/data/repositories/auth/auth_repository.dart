import '../../models/user/user.dart';

abstract interface class AuthRepository {
  Future<void> signInWithGoogle();

  Future<bool> isSignedIn();

  Future<User> fetchUser();

  Future<void> signOut();
}
