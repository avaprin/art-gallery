import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:rxdart/rxdart.dart';

import '../../../data/inputs/update_user_input.dart';
import '../../../data/models/user/user.dart';
import '../../../data/repositories/auth/auth_repository.dart';
import '../../../data/repositories/user/user_repository.dart';
import '../../../navigation/router.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final AuthRepository _authRepository;
  final UserRepository _userRepository;
  final AppRouter _appRouter;

  ProfileBloc({
    required AuthRepository authRepository,
    required UserRepository userRepository,
    required AppRouter appRouter,
  })  : _authRepository = authRepository,
        _userRepository = userRepository,
        _appRouter = appRouter,
        super(const ProfileLoading()) {
    on<ProfileFetch>(_handleProfileFetch);
    on<ProfileChange>(
      _handleProfileChange,
      transformer: _profileChangeTransformer,
    );
    on<ProfileSignOut>(_handleProfileSignOut);

    add(const ProfileFetch());
  }

  Future<void> _handleProfileFetch(
    ProfileFetch event,
    Emitter<ProfileState> emit,
  ) async {
    try {
      emit(const ProfileLoading());

      final User user = await _authRepository.fetchUser();

      emit(
        ProfileSuccess(
          user: user,
        ),
      );
    } catch (_) {
      emit(const ProfileFailure());
    }
  }

  Future<void> _handleProfileChange(
    ProfileChange event,
    Emitter<ProfileState> emit,
  ) async {
    try {
      await _userRepository.update(
        UpdateUserInput(
          name: event.name,
        ),
      );
    } catch (_) {
      emit(const ProfileFailure());
    }
  }

  Future<void> _handleProfileSignOut(
    ProfileSignOut event,
    Emitter<ProfileState> emit,
  ) async {
    try {
      emit(const ProfileLoading());

      await _authRepository.signOut();
      await _appRouter.replacePath('/');
    } catch (_) {
      emit(const ProfileFailure());
    }
  }

  Stream<T> _profileChangeTransformer<T>(
    Stream<T> events,
    Stream<T> Function(T) mapper,
  ) {
    return events
        .debounceTime(const Duration(milliseconds: 300))
        .distinct()
        .switchMap(mapper);
  }
}
