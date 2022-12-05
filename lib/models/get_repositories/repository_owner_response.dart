import 'package:flutter/cupertino.dart';
import 'package:functional_data/functional_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'repository_owner_response.g.dart';
// ignore_for_file: annotate_overrides

@immutable
@JsonSerializable(fieldRename: FieldRename.snake)
@FunctionalData()
class RepositoryOwnerResponse extends $RepositoryOwnerResponse {
  const RepositoryOwnerResponse({
    required this.avatarUrl,
  });

  final String avatarUrl;

  factory RepositoryOwnerResponse.fromJson(Map<String, dynamic> data) => _$RepositoryOwnerResponseFromJson(data);

  Map<String, dynamic>? toJson() => _$RepositoryOwnerResponseToJson(this);
}
