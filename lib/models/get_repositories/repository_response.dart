import 'package:flutter/cupertino.dart';
import 'package:functional_data/functional_data.dart';
import 'package:json_annotation/json_annotation.dart';

import 'repository_license_response.dart';
import 'repository_owner_response.dart';

part 'repository_response.g.dart';
// ignore_for_file: annotate_overrides

@JsonSerializable(fieldRename: FieldRename.snake)
@immutable
@FunctionalData()
class RepositoryResponse extends $RepositoryResponse {
  const RepositoryResponse({
    required this.id,
    required this.name,
    required this.fullName,
    required this.private,
    required this.owner,
    required this.watchersCount,
    required this.score,
    this.license,
  });

  final int id;
  final String name;
  final String fullName;
  final bool private;
  final RepositoryOwnerResponse owner;
  final int watchersCount;
  final RepositoryLicenseResponse? license;
  final double score;

  factory RepositoryResponse.fromJson(Map<String, dynamic> data) => _$RepositoryResponseFromJson(data);

  Map<String, dynamic> toJson() => _$RepositoryResponseToJson(this);
}
