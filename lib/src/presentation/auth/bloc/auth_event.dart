part of 'auth_bloc.dart';

sealed class AuthEvent {
  const AuthEvent();
}

final class AuthInit extends AuthEvent {
  const AuthInit();
}

final class AuthGoogleSignIn extends AuthEvent {
  const AuthGoogleSignIn();
}
