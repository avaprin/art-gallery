import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../theme/assets.dart';
import '../bloc/auth_bloc.dart';

class AuthContent extends StatefulWidget {
  const AuthContent({super.key});

  @override
  State<AuthContent> createState() => _AuthContentState();
}

class _AuthContentState extends State<AuthContent> {
  void _handleGoogleSignInTap() {
    context.read<AuthBloc>().add(
          const AuthGoogleSignIn(),
        );
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 60,
        horizontal: 20,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          //
          ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(40),
            ),
            child: Image.asset(
              Assets.staryNightImagePath,
              fit: BoxFit.contain,
            ),
          ),

          const SizedBox(height: 50),

          Text(
            'Discover Unique Artworks',
            style: textTheme.headlineMedium,
          ),

          const SizedBox(height: 10),

          Text(
            'Explore a world of creativity, browse diverse collections. Your next masterpiece awaits!',
            textAlign: TextAlign.center,
            style: textTheme.bodyLarge,
          ),

          const Spacer(),

          BlocBuilder<AuthBloc, AuthState>(
            builder: (BuildContext context, AuthState state) {
              return state is AuthLoading
                  ? const CircularProgressIndicator()
                  : FilledButton.tonal(
                      child: const Text('Sign In With Google'),
                      onPressed: _handleGoogleSignInTap,
                    );
            },
          ),
        ],
      ),
    );
  }
}
