import 'package:flutter/material.dart';
import '../features/auth/auth_gate.dart';

class SpotiApp extends StatelessWidget {
  const SpotiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spoti',
      theme: ThemeData(useMaterial3: true),
      home: const AuthGate(),
    );
  }
}