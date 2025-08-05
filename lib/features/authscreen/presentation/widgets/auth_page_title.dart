import 'package:flutter/material.dart';

class AuthPageTitle extends StatelessWidget {
  final String title;
  const AuthPageTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.labelLarge,
    );
  }
}
