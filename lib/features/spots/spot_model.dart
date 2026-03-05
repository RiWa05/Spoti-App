class Spot {
  final String id;
  final String title;
  final String city;
  final String description;
  final List<String> tags;

  Spot({
    required this.id,
    required this.title,
    required this.city,
    required this.description,
    required this.tags,
  });

  factory Spot.fromMap(String id, Map<String, dynamic> data) {
    return Spot(
      id: id,
      title: (data['title'] ?? '') as String,
      city: (data['city'] ?? '') as String,
      description: (data['description'] ?? '') as String,
      tags: List<String>.from((data['tags'] ?? []) as List),
    );
  }
}