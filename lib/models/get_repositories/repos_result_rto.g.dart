// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repos_result_rto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReposResultRTO _$ReposResultRTOFromJson(Map<String, dynamic> json) =>
    ReposResultRTO(
      items: (json['items'] as List<dynamic>)
          .map((e) => RepositoryRTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ReposResultRTOToJson(ReposResultRTO instance) =>
    <String, dynamic>{
      'items': instance.items,
    };
