// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repository_owner_response.dart';

// **************************************************************************
// FunctionalDataGenerator
// **************************************************************************

abstract class $RepositoryOwnerResponse {
  const $RepositoryOwnerResponse();

  String get avatarUrl;

  RepositoryOwnerResponse copyWith({
    String? avatarUrl,
  }) =>
      RepositoryOwnerResponse(
        avatarUrl: avatarUrl ?? this.avatarUrl,
      );

  RepositoryOwnerResponse copyUsing(
      void Function(RepositoryOwnerResponse$Change change) mutator) {
    final change = RepositoryOwnerResponse$Change._(
      this.avatarUrl,
    );
    mutator(change);
    return RepositoryOwnerResponse(
      avatarUrl: change.avatarUrl,
    );
  }

  @override
  String toString() => "RepositoryOwnerResponse(avatarUrl: $avatarUrl)";

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  bool operator ==(Object other) =>
      other is RepositoryOwnerResponse &&
      other.runtimeType == runtimeType &&
      avatarUrl == other.avatarUrl;

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  int get hashCode {
    return avatarUrl.hashCode;
  }
}

class RepositoryOwnerResponse$Change {
  RepositoryOwnerResponse$Change._(
    this.avatarUrl,
  );

  String avatarUrl;
}

// ignore: avoid_classes_with_only_static_members
class RepositoryOwnerResponse$ {
  static final avatarUrl = Lens<RepositoryOwnerResponse, String>(
    (avatarUrlContainer) => avatarUrlContainer.avatarUrl,
    (avatarUrlContainer, avatarUrl) =>
        avatarUrlContainer.copyWith(avatarUrl: avatarUrl),
  );
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RepositoryOwnerResponse _$RepositoryOwnerResponseFromJson(
        Map<String, dynamic> json) =>
    RepositoryOwnerResponse(
      avatarUrl: json['avatar_url'] as String,
    );

Map<String, dynamic> _$RepositoryOwnerResponseToJson(
        RepositoryOwnerResponse instance) =>
    <String, dynamic>{
      'avatar_url': instance.avatarUrl,
    };
