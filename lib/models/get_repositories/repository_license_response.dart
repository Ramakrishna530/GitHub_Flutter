import 'package:flutter/cupertino.dart';
import 'package:functional_data/functional_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'repository_license_response.g.dart';
// ignore_for_file: annotate_overrides

@immutable
@FunctionalData()
@JsonSerializable(fieldRename: FieldRename.snake)
class RepositoryLicenseResponse extends $RepositoryLicenseResponse {
  const RepositoryLicenseResponse({
    required this.name,
  });

  final String name;

  factory RepositoryLicenseResponse.fromJson(Map<String, dynamic> data) => _$RepositoryLicenseResponseFromJson(data);

  Map<String, dynamic> toJson() => _$RepositoryLicenseResponseToJson(this);
}
