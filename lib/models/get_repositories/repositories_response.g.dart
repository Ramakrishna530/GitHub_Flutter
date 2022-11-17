// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repositories_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RepositoriesResponse _$RepositoriesResponseFromJson(
        Map<String, dynamic> json) =>
    RepositoriesResponse(
      items: (json['items'] as List<dynamic>)
          .map((e) => RepositoryResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RepositoriesResponseToJson(
        RepositoriesResponse instance) =>
    <String, dynamic>{
      'items': instance.items,
    };
