import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../di/app_di.dart';

import '../bloc/profile_bloc.dart';
import 'profile_content.dart';

@RoutePage()
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfileBloc>(
      create: (_) => ProfileBloc(
        authRepository: authRepository,
        userRepository: userRepository,
        appRouter: appRouter,
      ),
      child: const Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          bottom: false,
          child: ProfileContent(),
        ),
      ),
    );
  }
}
