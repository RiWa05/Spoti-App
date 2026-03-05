import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../profile/interests_page.dart';
import '../spots/spot_list_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Spoti'),
        actions: [
          IconButton(
            tooltip: 'Interessen',
            icon: const Icon(Icons.tune),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const InterestsPage()),
              );
            },
          ),
          IconButton(
            tooltip: 'Logout',
            icon: const Icon(Icons.logout),
            onPressed: () => FirebaseAuth.instance.signOut(),
          ),
        ],
      ),
      body: const SpotListPage(),
    );
  }
}