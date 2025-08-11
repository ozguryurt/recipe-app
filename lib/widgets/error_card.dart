import 'package:flutter/material.dart';

class ErrorCard extends StatelessWidget {
  final String errorMessage;
  final Function() onPressed;
  const ErrorCard(
      {super.key, required this.errorMessage, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          Icons.error_outline,
          size: 64,
          color: Colors.red.shade300,
        ),
        const SizedBox(height: 16),
        Text(
          'Error',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 8),
        Text(
          errorMessage,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: onPressed,
          child: const Text('Try Again'),
        ),
      ],
    );
  }
}
