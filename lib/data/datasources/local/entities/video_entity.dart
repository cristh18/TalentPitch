class VideoEntity {
  const VideoEntity(
      {required this.id,
      required this.playlistId,
      required this.url,
      required this.createdAt,
      required this.updatedAt});

  final int id;
  final int playlistId;
  final String url;
  final DateTime createdAt;
  final DateTime updatedAt;

  Map<String, Object?> toMap() {
    return <String, Object?>{
      'id': id,
      'playlist_id': playlistId,
      'url': url,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }

  @override
  String toString() {
    return 'VideoEntity{id: $id, playlistId: $playlistId, url: $url, createdAt: $createdAt, updatedAt: $updatedAt}';
  }
}
