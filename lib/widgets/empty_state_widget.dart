import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class EmptyStateWidget extends StatelessWidget {
  final String message;
  final String? animationPath;

  const EmptyStateWidget({
    super.key,
    required this.message,
    this.animationPath,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (animationPath != null)
              Lottie.asset(
                animationPath!,
                width: 200,
                height: 200,
                errorBuilder: (context, error, stackTrace) {
                  return Icon(
                    Icons.inbox_outlined,
                    size: 80,
                    color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.5),
                  );
                },
              )
            else
              Icon(
                Icons.inbox_outlined,
                size: 80,
                color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.5),
              ),
            const SizedBox(height: 24),
            Text(
              message,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7),
                  ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

