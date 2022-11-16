// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repository_rto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RepositoryRTO _$RepositoryRTOFromJson(Map<String, dynamic> json) =>
    RepositoryRTO(
      id: json['id'] as int,
      name: json['name'] as String,
      fullName: json['full_name'] as String,
      private: json['private'] as bool,
      owner: RepositoryOwnerRTO.fromJson(json['owner'] as Map<String, dynamic>),
      watchersCount: json['watchers_count'] as int,
      license: json['license'] == null
          ? null
          : RepositoryLicenseRTO.fromJson(
              json['license'] as Map<String, dynamic>),
      score: (json['score'] as num).toDouble(),
    );

Map<String, dynamic> _$RepositoryRTOToJson(RepositoryRTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'full_name': instance.fullName,
      'private': instance.private,
      'owner': instance.owner,
      'watchers_count': instance.watchersCount,
      'license': instance.license,
      'score': instance.score,
    };
