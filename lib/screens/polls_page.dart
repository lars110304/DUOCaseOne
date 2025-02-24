import 'package:flutter/material.dart';

class PollsPage extends StatelessWidget {
  const PollsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Polls Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}