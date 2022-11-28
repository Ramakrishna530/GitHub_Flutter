// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contributor_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContributorResponse _$ContributorResponseFromJson(Map<String, dynamic> json) =>
    ContributorResponse(
      url: json['url'] as String,
      contributions: json['contributions'] as int,
    );

Map<String, dynamic> _$ContributorResponseToJson(
        ContributorResponse instance) =>
    <String, dynamic>{
      'url': instance.url,
      'contributions': instance.contributions,
    };
