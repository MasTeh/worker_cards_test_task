import 'package:flutter/material.dart';

class WorkersListError extends StatelessWidget {
  const WorkersListError({super.key, this.onRetry, this.error});
  final VoidCallback? onRetry;
  final Object? error;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Что-то пошло не так', style: TextStyle(fontSize: 24)),
          if (error != null)
            Text(
              error.toString(),
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          const SizedBox(height: 16),
          if (onRetry != null)
            ElevatedButton(
              onPressed: () {
                onRetry?.call();
              },
              child: const Text('Повторить'),
            ),
        ],
      ),
    );
  }
}
