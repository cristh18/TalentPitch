class PlaylistEntity {
  const PlaylistEntity(
      {required this.id,
      required this.name,
      required this.description,
      required this.createdAt,
      required this.updatedAt});

  final int id;
  final String name;
  final String description;
  final DateTime createdAt;
  final DateTime updatedAt;

  Map<String, Object?> toMap() {
    return <String, Object?>{
      'id': id,
      'name': name,
      'description': description,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }

  @override
  String toString() {
    return 'PlaylistEntity{id: $id, name: $name, description: $description, createdAt: $createdAt, updatedAt: $updatedAt}';
  }
}
