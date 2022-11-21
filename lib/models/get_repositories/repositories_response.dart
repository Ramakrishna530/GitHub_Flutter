import 'package:json_annotation/json_annotation.dart';

import 'repository_response.dart';

part 'repositories_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class RepositoriesResponse {
  RepositoriesResponse({
    required this.items,
  });

  final List<RepositoryResponse> items;

  factory RepositoriesResponse.fromJson(Map<String, dynamic> data) =>
      _$RepositoriesResponseFromJson(data);

  Map<String, dynamic> toJson() => _$RepositoriesResponseToJson(this);
}
