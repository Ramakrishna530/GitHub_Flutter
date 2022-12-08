// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repository_response.dart';

// **************************************************************************
// FunctionalDataGenerator
// **************************************************************************

abstract class $RepositoryResponse {
  const $RepositoryResponse();

  int get id;
  String get name;
  String get fullName;
  bool get private;
  RepositoryOwnerResponse get owner;
  int get watchersCount;
  RepositoryLicenseResponse? get license;
  double get score;

  RepositoryResponse copyWith({
    int? id,
    String? name,
    String? fullName,
    bool? private,
    RepositoryOwnerResponse? owner,
    int? watchersCount,
    RepositoryLicenseResponse? license,
    double? score,
  }) =>
      RepositoryResponse(
        id: id ?? this.id,
        name: name ?? this.name,
        fullName: fullName ?? this.fullName,
        private: private ?? this.private,
        owner: owner ?? this.owner,
        watchersCount: watchersCount ?? this.watchersCount,
        license: license ?? this.license,
        score: score ?? this.score,
      );

  RepositoryResponse copyUsing(
      void Function(RepositoryResponse$Change change) mutator) {
    final change = RepositoryResponse$Change._(
      this.id,
      this.name,
      this.fullName,
      this.private,
      this.owner,
      this.watchersCount,
      this.license,
      this.score,
    );
    mutator(change);
    return RepositoryResponse(
      id: change.id,
      name: change.name,
      fullName: change.fullName,
      private: change.private,
      owner: change.owner,
      watchersCount: change.watchersCount,
      license: change.license,
      score: change.score,
    );
  }

  @override
  String toString() =>
      "RepositoryResponse(id: $id, name: $name, fullName: $fullName, private: $private, owner: $owner, watchersCount: $watchersCount, license: $license, score: $score)";

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  bool operator ==(Object other) =>
      other is RepositoryResponse &&
      other.runtimeType == runtimeType &&
      id == other.id &&
      name == other.name &&
      fullName == other.fullName &&
      private == other.private &&
      owner == other.owner &&
      watchersCount == other.watchersCount &&
      license == other.license &&
      score == other.score;

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  int get hashCode {
    var result = 17;
    result = 37 * result + id.hashCode;
    result = 37 * result + name.hashCode;
    result = 37 * result + fullName.hashCode;
    result = 37 * result + private.hashCode;
    result = 37 * result + owner.hashCode;
    result = 37 * result + watchersCount.hashCode;
    result = 37 * result + license.hashCode;
    result = 37 * result + score.hashCode;
    return result;
  }
}

class RepositoryResponse$Change {
  RepositoryResponse$Change._(
    this.id,
    this.name,
    this.fullName,
    this.private,
    this.owner,
    this.watchersCount,
    this.license,
    this.score,
  );

  int id;
  String name;
  String fullName;
  bool private;
  RepositoryOwnerResponse owner;
  int watchersCount;
  RepositoryLicenseResponse? license;
  double score;
}

// ignore: avoid_classes_with_only_static_members
class RepositoryResponse$ {
  static final id = Lens<RepositoryResponse, int>(
    (idContainer) => idContainer.id,
    (idContainer, id) => idContainer.copyWith(id: id),
  );

  static final name = Lens<RepositoryResponse, String>(
    (nameContainer) => nameContainer.name,
    (nameContainer, name) => nameContainer.copyWith(name: name),
  );

  static final fullName = Lens<RepositoryResponse, String>(
    (fullNameContainer) => fullNameContainer.fullName,
    (fullNameContainer, fullName) =>
        fullNameContainer.copyWith(fullName: fullName),
  );

  static final private = Lens<RepositoryResponse, bool>(
    (privateContainer) => privateContainer.private,
    (privateContainer, private) => privateContainer.copyWith(private: private),
  );

  static final owner = Lens<RepositoryResponse, RepositoryOwnerResponse>(
    (ownerContainer) => ownerContainer.owner,
    (ownerContainer, owner) => ownerContainer.copyWith(owner: owner),
  );

  static final watchersCount = Lens<RepositoryResponse, int>(
    (watchersCountContainer) => watchersCountContainer.watchersCount,
    (watchersCountContainer, watchersCount) =>
        watchersCountContainer.copyWith(watchersCount: watchersCount),
  );

  static final license = Lens<RepositoryResponse, RepositoryLicenseResponse?>(
    (licenseContainer) => licenseContainer.license,
    (licenseContainer, license) => licenseContainer.copyWith(license: license),
  );

  static final score = Lens<RepositoryResponse, double>(
    (scoreContainer) => scoreContainer.score,
    (scoreContainer, score) => scoreContainer.copyWith(score: score),
  );
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RepositoryResponse _$RepositoryResponseFromJson(Map<String, dynamic> json) =>
    RepositoryResponse(
      id: json['id'] as int,
      name: json['name'] as String,
      fullName: json['full_name'] as String,
      private: json['private'] as bool,
      owner: RepositoryOwnerResponse.fromJson(
          json['owner'] as Map<String, dynamic>),
      watchersCount: json['watchers_count'] as int,
      score: (json['score'] as num).toDouble(),
      license: json['license'] == null
          ? null
          : RepositoryLicenseResponse.fromJson(
              json['license'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RepositoryResponseToJson(RepositoryResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'full_name': instance.fullName,
      'private': instance.private,
      'owner': instance.owner,
      'watchers_count': instance.watchersCount,
      'license': instance.license,
      'score': instance.score,
    };
