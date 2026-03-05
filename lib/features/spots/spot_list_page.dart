import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'spot_model.dart';

class SpotListPage extends StatelessWidget {
  const SpotListPage({super.key});

  Stream<List<Spot>> spotsStream() {
    return FirebaseFirestore.instance.collection('spots').snapshots().map(
      (snapshot) => snapshot.docs
          .map((doc) => Spot.fromMap(doc.id, doc.data()))
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Spot>>(
      stream: spotsStream(),
      builder: (context, snap) {
        if (snap.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snap.hasError) {
          return Center(child: Text('Fehler: ${snap.error}'));
        }

        final spots = snap.data ?? [];
        if (spots.isEmpty) {
          return const Center(child: Text('Noch keine Spots vorhanden.'));
        }

        return ListView.separated(
          padding: const EdgeInsets.all(16),
          itemCount: spots.length,
          separatorBuilder: (_, __) => const SizedBox(height: 12),
          itemBuilder: (context, i) {
            final s = spots[i];
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      s.title,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 4),
                    Text(s.city),
                    const SizedBox(height: 8),
                    Text(s.description),
                    const SizedBox(height: 10),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: s.tags.map((t) => Chip(label: Text(t))).toList(),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}