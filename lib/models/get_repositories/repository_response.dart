import 'package:json_annotation/json_annotation.dart';

import 'repository_license_response.dart';
import 'repository_owner_response.dart';

part 'repository_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class RepositoryResponse {
  RepositoryResponse({
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

  factory RepositoryResponse.fromJson(Map<String, dynamic> data) =>
      _$RepositoryResponseFromJson(data);

  Map<String, dynamic> toJson() => _$RepositoryResponseToJson(this);
}
