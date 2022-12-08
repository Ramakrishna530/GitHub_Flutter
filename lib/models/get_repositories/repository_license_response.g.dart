// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repository_license_response.dart';

// **************************************************************************
// FunctionalDataGenerator
// **************************************************************************

abstract class $RepositoryLicenseResponse {
  const $RepositoryLicenseResponse();

  String get name;

  RepositoryLicenseResponse copyWith({
    String? name,
  }) =>
      RepositoryLicenseResponse(
        name: name ?? this.name,
      );

  RepositoryLicenseResponse copyUsing(
      void Function(RepositoryLicenseResponse$Change change) mutator) {
    final change = RepositoryLicenseResponse$Change._(
      this.name,
    );
    mutator(change);
    return RepositoryLicenseResponse(
      name: change.name,
    );
  }

  @override
  String toString() => "RepositoryLicenseResponse(name: $name)";

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  bool operator ==(Object other) =>
      other is RepositoryLicenseResponse &&
      other.runtimeType == runtimeType &&
      name == other.name;

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  int get hashCode {
    return name.hashCode;
  }
}

class RepositoryLicenseResponse$Change {
  RepositoryLicenseResponse$Change._(
    this.name,
  );

  String name;
}

// ignore: avoid_classes_with_only_static_members
class RepositoryLicenseResponse$ {
  static final name = Lens<RepositoryLicenseResponse, String>(
    (nameContainer) => nameContainer.name,
    (nameContainer, name) => nameContainer.copyWith(name: name),
  );
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RepositoryLicenseResponse _$RepositoryLicenseResponseFromJson(
        Map<String, dynamic> json) =>
    RepositoryLicenseResponse(
      name: json['name'] as String,
    );

Map<String, dynamic> _$RepositoryLicenseResponseToJson(
        RepositoryLicenseResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
    };
