import 'package:json_annotation/json_annotation.dart';

part 'repository_owner_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class RepositoryOwnerResponse {
  RepositoryOwnerResponse({
    required this.avatarUrl,
  });

  final String avatarUrl;

  factory RepositoryOwnerResponse.fromJson(Map<String, dynamic> data) => _$RepositoryOwnerResponseFromJson(data);

  Map<String, dynamic>? toJson() => _$RepositoryOwnerResponseToJson(this);
}
