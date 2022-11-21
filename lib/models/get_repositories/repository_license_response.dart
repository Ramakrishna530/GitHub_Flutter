import 'package:json_annotation/json_annotation.dart';

part 'repository_license_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class RepositoryLicenseResponse {
  RepositoryLicenseResponse({
    required this.name,
  });

  final String name;

  factory RepositoryLicenseResponse.fromJson(Map<String, dynamic> data) =>
      _$RepositoryLicenseResponseFromJson(data);

  Map<String, dynamic> toJson() => _$RepositoryLicenseResponseToJson(this);
}
