import 'package:json_annotation/json_annotation.dart';

import '../../../../utils/date_util.dart';
import '../../../../utils/general_util.dart';

@JsonSerializable(explicitToJson: true)
class VideoDataResponseDto {
  VideoDataResponseDto({
    required this.about,
    required this.aboutVideo,
    required this.avatar,
    required this.benefitsInCompanies,
    required this.career,
    required this.city,
    required this.compatibility,
    required this.compatibilityReason,
    required this.completedProfile,
    required this.connected,
    required this.country,
    required this.createdAt,
    required this.desiredRole,
    required this.email,
    required this.facebook,
    required this.highlight,
    required this.id,
    required this.instagram,
    required this.interestAreas,
    required this.knowledges,
    required this.like,
    required this.likesCount,
    required this.linkedin,
    required this.myLanguages,
    required this.name,
    required this.onboardingGoal,
    required this.position,
    required this.preferWork,
    required this.programsForProductivity,
    required this.requestPitch,
    required this.resumeDescription,
    required this.resumeDownload,
    required this.resumeId,
    required this.reviewGeneralUser,
    required this.skills,
    required this.slug,
    required this.sponsored,
    required this.twitter,
    required this.video,
    required this.videoType,
    required this.videoUrl,
    required this.wantToBe,
    required this.wantToWork,
    required this.workMethodologies,
  });

  factory VideoDataResponseDto.fromJson(Map<String, dynamic> json) {
    return VideoDataResponseDto(
      about: json['about'] ?? '',
      aboutVideo: json['about_video'] ?? '',
      avatar: json['avatar'] ?? '',
      benefitsInCompanies: json['benefits_in_companies'] ?? '',
      career: json['career'] ?? '',
      city: json['city'] ?? '',
      compatibility: json['compatibility'],
      compatibilityReason: json['compatibility_reason'],
      completedProfile: json['completed_profile'] ?? 0,
      connected: getConnectedValue(json['connected']),
      country: json['country'] ?? '',
      createdAt: tryParse(json['created_at']),
      desiredRole: json['desired_role'] ?? '',
      email: json['email'] ?? '',
      facebook: json['facebook'] ?? '',
      highlight: json['highlight'] ?? 0,
      id: json['id'] ?? -1,
      instagram: json['instagram'] ?? '',
      interestAreas: json['interest_areas'] ?? '',
      knowledges: json['knowledges'] ?? '',
      like: json['like'] ?? 0,
      likesCount: json['likes_count'] ?? 0,
      linkedin: json['linkedin'] ?? '',
      myLanguages: json['my_languages'] ?? '',
      name: json['name'] ?? '',
      onboardingGoal: json['onboarding_goal'] ?? '',
      position: json['position'] ?? '',
      preferWork: json['prefer_work'] ?? '',
      programsForProductivity: json['programs_for_productivity'] ?? '',
      requestPitch: json['request_pitch'] ?? 0,
      resumeDescription: json['resume_description'] ?? '',
      resumeDownload: json['resume_download'] ?? false,
      resumeId: json['resume_id'] ?? 0,
      reviewGeneralUser: json['review_general_user'] ?? 0,
      skills: json['skills'] ?? '',
      slug: json['slug'] ?? '',
      sponsored: json['sponsored'] ?? 0,
      twitter: json['twitter'] ?? '',
      video: json['video'] ?? '',
      videoType: json['video_type'] ?? '',
      videoUrl: json['video_url'] ?? '',
      wantToBe: json['want_to_be'] ?? '',
      wantToWork: json['want_to_work'] ?? '',
      workMethodologies: json['work_methodologies'] ?? '',
    );
  }

  final String about;
  final String aboutVideo;
  final String avatar;
  final String benefitsInCompanies;
  final String career;
  final String city;
  final dynamic compatibility;
  final dynamic compatibilityReason;
  final int completedProfile;
  final String connected;
  final String country;
  final DateTime createdAt;
  final String desiredRole;
  final String email;
  final String facebook;
  final int highlight;
  final int id;
  final String instagram;
  final String interestAreas;
  final String knowledges;
  final int like;
  final int likesCount;
  final String linkedin;
  final String myLanguages;
  final String name;
  final String onboardingGoal;
  final String position;
  final String preferWork;
  final String programsForProductivity;
  final int requestPitch;
  final String resumeDescription;
  final bool resumeDownload;
  final int resumeId;
  final int reviewGeneralUser;
  final String skills;
  final String slug;
  final int sponsored;
  final String twitter;
  final String video;
  final String videoType;
  final String videoUrl;
  final String wantToBe;
  final String wantToWork;
  final String workMethodologies;
}
