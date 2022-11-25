// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repository_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RepositoryResponse _$RepositoryResponseFromJson(Map<String, dynamic> json) => RepositoryResponse(
      id: json['id'] as int,
      name: json['name'] as String,
      fullName: json['full_name'] as String,
      private: json['private'] as bool,
      owner: RepositoryOwnerResponse.fromJson(json['owner'] as Map<String, dynamic>),
      watchersCount: json['watchers_count'] as int,
      score: (json['score'] as num).toDouble(),
      license:
          json['license'] == null ? null : RepositoryLicenseResponse.fromJson(json['license'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RepositoryResponseToJson(RepositoryResponse instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'full_name': instance.fullName,
      'private': instance.private,
      'owner': instance.owner,
      'watchers_count': instance.watchersCount,
      'license': instance.license,
      'score': instance.score,
    };
