import 'package:json_annotation/json_annotation.dart';

part 'repository_license_rto.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class RepositoryLicenseRTO {
  final String name;
  RepositoryLicenseRTO({required this.name});

  factory RepositoryLicenseRTO.fromJson(Map<String, dynamic> data) =>
      _$RepositoryLicenseRTOFromJson(data);

  Map<String, dynamic> toJson() => _$RepositoryLicenseRTOToJson(this);
}
