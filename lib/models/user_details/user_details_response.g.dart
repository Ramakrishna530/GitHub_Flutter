// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_details_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDetailsResponse _$UserDetailsResponseFromJson(Map<String, dynamic> json) =>
    UserDetailsResponse(
      avatarUrl: json['avatar_url'] as String,
      followers: json['followers'] as int,
      name: json['name'] as String?,
      bio: json['bio'] as String?,
      company: json['company'] as String?,
    );

Map<String, dynamic> _$UserDetailsResponseToJson(
        UserDetailsResponse instance) =>
    <String, dynamic>{
      'avatar_url': instance.avatarUrl,
      'followers': instance.followers,
      'name': instance.name,
      'bio': instance.bio,
      'company': instance.company,
    };
