class PitchModel {
  PitchModel(
      {required this.name,
      required this.avatar,
      required this.desiredRole,
      required this.video,
      required this.videoUrl});

  final String name;
  final String avatar;
  final String desiredRole;
  final String video;
  final String videoUrl;

  @override
  String toString() {
    return 'PitchModel{name: $name, avatar: $avatar, desiredRole: $desiredRole, video: $video, videoUrl: $videoUrl}';
  }
}
