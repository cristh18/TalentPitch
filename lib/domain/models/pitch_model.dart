class PitchModel {
  PitchModel(
      {required this.name,
      required this.avatar,
      required this.desiredRole,
      required this.country,
      required this.city,
      required this.knowledges,
      required this.skills,
      required this.resumeDescription,
      required this.video,
      required this.videoUrl});

  final String name;
  final String avatar;
  final String desiredRole;
  final String country;
  final String city;
  final String knowledges;
  final String skills;
  final String resumeDescription;
  final String video;
  final String videoUrl;

  @override
  String toString() {
    return 'PitchModel{name: $name, avatar: $avatar, desiredRole: $desiredRole, video: $video, videoUrl: $videoUrl}';
  }
}
