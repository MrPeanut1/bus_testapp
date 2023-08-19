import 'package:flutter/material.dart';

class ShowMapScreen extends StatelessWidget {
  const ShowMapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Show Map'),
      ),
      body: const Center(
        child: Text('This is the Show Map feature.'),
      ),
    );
  }
}