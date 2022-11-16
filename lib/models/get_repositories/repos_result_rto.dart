import 'package:json_annotation/json_annotation.dart';

import 'repository_rto.dart';

part 'repos_result_rto.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ReposResultRTO {
  final List<RepositoryRTO> items;

  ReposResultRTO({required this.items});

  factory ReposResultRTO.fromJson(Map<String, dynamic> data) =>
      _$ReposResultRTOFromJson(data);

  Map<String, dynamic> toJson() => _$ReposResultRTOToJson(this);
}
