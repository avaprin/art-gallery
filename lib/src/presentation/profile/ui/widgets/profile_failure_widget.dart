import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/profile_bloc.dart';

class ProfileFailureWidget extends StatefulWidget {
  const ProfileFailureWidget({super.key});

  @override
  State<ProfileFailureWidget> createState() => _ProfileFailureWidgetState();
}

class _ProfileFailureWidgetState extends State<ProfileFailureWidget> {
  void _handleRetryTap() {
    context.read<ProfileBloc>().add(
          const ProfileFetch(),
        );
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
        ),
        child: Column(
          spacing: 10,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //
            Icon(
              Icons.error_outline,
              size: 50,
              color: colorScheme.error,
            ),

            Text(
              'Oops! Something went wrong. Please try again.',
              textAlign: TextAlign.center,
              style: textTheme.bodyLarge,
            ),

            FilledButton.tonal(
              onPressed: _handleRetryTap,
              child: const Text('Try again'),
            ),
          ],
        ),
      ),
    );
  }
}
