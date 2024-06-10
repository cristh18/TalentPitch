class PitchModel {
  PitchModel(
      {required this.id,
      required this.name,
      required this.avatar,
      required this.desiredRole,
      required this.country,
      required this.city,
      required this.knowledges,
      required this.skills,
      required this.resumeDescription,
      required this.video,
      required this.videoUrl});

  factory PitchModel.fromMap(Map<String, dynamic> map) {
    return PitchModel(
      id: map['id'] as int,
      name: map['name'] as String,
      avatar: map['avatar'] as String,
      desiredRole: map['desiredRole'] as String,
      country: map['country'] as String,
      city: map['city'] as String,
      knowledges: map['knowledges'] as String,
      skills: map['skills'] as String,
      resumeDescription: map['resumeDescription'] as String,
      video: map['video'] as String,
      videoUrl: map['videoUrl'] as String,
    );
  }

  final int id;
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

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'avatar': avatar,
      'desiredRole': desiredRole,
      'country': country,
      'city': city,
      'knowledges': knowledges,
      'skills': skills,
      'resumeDescription': resumeDescription,
      'video': video,
      'videoUrl': videoUrl,
    };
  }
}
