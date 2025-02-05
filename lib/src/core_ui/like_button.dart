import 'package:flutter/material.dart';

class LikeButton extends StatelessWidget {
  const LikeButton({
    required this.onTap,
    required this.isFavourite,
    super.key,
  });

  final VoidCallback onTap;
  final bool isFavourite;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    IconData icon;
    Color color;
    if (isFavourite) {
      icon = Icons.favorite_rounded;
      color = colorScheme.error;
    } else {
      icon = Icons.favorite_border_rounded;
      color = colorScheme.onSurface;
    }
    return GestureDetector(
      child: AnimatedSwitcher(
        duration: Durations.medium4,
        transitionBuilder: (
          Widget child,
          Animation<double> animation,
        ) {
          return ScaleTransition(
            scale: animation,
            child: FadeTransition(
              opacity: animation,
              child: child,
            ),
          );
        },
        child: Icon(
          icon,
          size: 30,
          color: color,
          key: ValueKey<bool>(isFavourite),
        ),
      ),
      onTap: onTap,
    );
  }
}
