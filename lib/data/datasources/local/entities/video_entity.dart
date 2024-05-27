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
}
