import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/models/user/user.dart';
import '../../bloc/profile_bloc.dart';

class ProfileSuccessWidget extends StatefulWidget {
  final User user;

  const ProfileSuccessWidget({
    required this.user,
    super.key,
  });

  @override
  State<ProfileSuccessWidget> createState() => _ProfileSuccessWidgetState();
}

class _ProfileSuccessWidgetState extends State<ProfileSuccessWidget> {
  late final TextEditingController _userNameTextEditingController =
      TextEditingController(
    text: widget.user.name,
  );

  void _handleUserChange(String name) {
    context.read<ProfileBloc>().add(
          ProfileChange(
            name: name,
          ),
        );
  }

  void _handleSignOutTap() {
    context.read<ProfileBloc>().add(
          const ProfileSignOut(),
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
      child: Center(
        child: Column(
          children: <Widget>[
            //
            const SizedBox(height: 200),

            CircleAvatar(
              radius: 40,
              foregroundImage: NetworkImage(
                '${widget.user.imageUrl}',
              ),
            ),

            const SizedBox(height: 10),

            TextField(
              textAlign: TextAlign.center,
              onChanged: _handleUserChange,
              controller: _userNameTextEditingController,
            ),

            const SizedBox(height: 10),

            Text(
              'User Email: ${widget.user.email}',
              style: textTheme.bodyLarge,
            ),

            const SizedBox(height: 10),

            Text(
              'User ID: ${widget.user.id}',
              style: textTheme.bodyLarge,
            ),

            const SizedBox(height: 10),

            Text(
              'Creation Date Time: ${widget.user.creationDateTime}',
              style: textTheme.bodyLarge,
            ),

            const SizedBox(height: 10),

            Text(
              'Last Sign In Date Time: ${widget.user.lastSignInDateTime}',
              style: textTheme.bodyLarge,
            ),

            const Spacer(),

            FilledButton.tonal(
              child: const Text('Sign Out'),
              onPressed: _handleSignOutTap,
            ),
          ],
        ),
      ),
    );
  }
}
