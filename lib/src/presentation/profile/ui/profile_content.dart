import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/user/user.dart';
import '../bloc/profile_bloc.dart';
import 'widgets/profile_failure_widget.dart';
import 'widgets/profile_loading_widget.dart';
import 'widgets/profile_success_widget.dart';

class ProfileContent extends StatelessWidget {
  const ProfileContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (_, ProfileState state) {
        return switch (state) {
          ProfileLoading() => const ProfileLoadingWidget(),
          ProfileFailure() => const ProfileFailureWidget(),
          ProfileSuccess(:final User user) => ProfileSuccessWidget(
              user: user,
            ),
        };
      },
    );
  }
}
