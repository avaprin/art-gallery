part of 'profile_bloc.dart';

sealed class ProfileState {
  const ProfileState();
}

final class ProfileLoading extends ProfileState {
  const ProfileLoading();
}

final class ProfileSuccess extends ProfileState {
  final User user;

  const ProfileSuccess({
    required this.user,
  });
}

final class ProfileFailure extends ProfileState {
  const ProfileFailure();
}
