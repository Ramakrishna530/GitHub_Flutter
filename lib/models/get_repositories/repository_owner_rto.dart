import 'package:json_annotation/json_annotation.dart';

part 'repository_owner_rto.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class RepositoryOwnerRTO {
  final String avatarUrl;
  RepositoryOwnerRTO({required this.avatarUrl});

  factory RepositoryOwnerRTO.fromJson(Map<String, dynamic> data) =>
      _$RepositoryOwnerRTOFromJson(data);

  Map<String, dynamic>? toJson() => _$RepositoryOwnerRTOToJson(this);
}
