part of 'profile_bloc.dart';

sealed class ProfileEvent {
  const ProfileEvent();
}

final class ProfileFetch extends ProfileEvent {
  const ProfileFetch();
}

final class ProfileChange extends ProfileEvent {
  final String name;

  const ProfileChange({
    required this.name,
  });
}

final class ProfileSignOut extends ProfileEvent {
  const ProfileSignOut();
}
