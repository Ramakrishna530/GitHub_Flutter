import 'package:json_annotation/json_annotation.dart';

import 'repository_license_rto.dart';
import 'repository_owner_rto.dart';

part 'repository_rto.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class RepositoryRTO {
  final int id;
  final String name;
  final String fullName;
  final bool private;
  final RepositoryOwnerRTO owner;
  final int watchersCount;
  final RepositoryLicenseRTO? license;
  final double score;

  RepositoryRTO(
      {required this.id,
      required this.name,
      required this.fullName,
      required this.private,
      required this.owner,
      required this.watchersCount,
      required this.score,
      this.license});

  factory RepositoryRTO.fromJson(Map<String, dynamic> data) =>
      _$RepositoryRTOFromJson(data);

  Map<String, dynamic> toJson() => _$RepositoryRTOToJson(this);
}
