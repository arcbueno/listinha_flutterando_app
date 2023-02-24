import 'package:flutter/material.dart';

class UserImageButton extends StatelessWidget {
  const UserImageButton({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return CircleAvatar(
      foregroundColor: colorScheme.onPrimary,
      backgroundColor: colorScheme.primary,
      child: InkWell(
        onTap: () {},
        child: const Text('PB'),
      ),
    );
  }
}
