import 'dart:async';

import 'package:bloc/bloc.dart';

import '../../../data/repositories/auth/auth_repository.dart';
import '../../../navigation/router.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;
  final AppRouter _appRouter;

  AuthBloc({
    required AuthRepository authRepository,
    required AppRouter appRouter,
  })  : _authRepository = authRepository,
        _appRouter = appRouter,
        super(const AuthLoading()) {
    on<AuthInit>(_handleAuthInit);
    on<AuthGoogleSignIn>(_handleAuthGoogleSignIn);

    add(const AuthInit());
  }

  Future<void> _handleAuthInit(
    AuthInit event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(const AuthLoading());

      await Future<void>.delayed(const Duration(seconds: 1));
      final bool isSignedIn = await _authRepository.isSignedIn();
      if (isSignedIn) await _appRouter.replacePath('/home');

      emit(const AuthSuccess());
    } catch (_) {
      emit(const AuthFailure());
    }
  }

  Future<void> _handleAuthGoogleSignIn(
    AuthGoogleSignIn event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(const AuthLoading());

      await _authRepository.signInWithGoogle();
      await _appRouter.replacePath('/home');
    } catch (_) {
      emit(const AuthFailure());
    }
  }
}
