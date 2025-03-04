import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../di/app_di.dart';
import '../bloc/auth_bloc.dart';
import 'auth_content.dart';

@RoutePage()
class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
      create: (BuildContext context) {
        return AuthBloc(
          authRepository: authRepository,
          appRouter: appRouter,
        );
      },
      child: const Scaffold(
        body: SafeArea(
          child: AuthContent(),
        ),
      ),
    );
  }
}
