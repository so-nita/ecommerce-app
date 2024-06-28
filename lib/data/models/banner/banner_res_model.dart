class ApiBanner {
  // Renamed from Banner to avoid conflict
  final int id;
  final String title;
  final String imagePath;

  ApiBanner({required this.id, required this.title, required this.imagePath});

  factory ApiBanner.fromJson(Map<String, dynamic> json) {
    return ApiBanner(
      id: json['id'],
      title: json['title'],
      imagePath: json['image_path'], // Use 'image_path' from the API response
    );
  }
}
