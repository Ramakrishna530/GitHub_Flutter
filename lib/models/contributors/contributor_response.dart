import 'package:json_annotation/json_annotation.dart';

part 'contributor_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ContributorResponse {
  ContributorResponse({
    required this.url,
    required this.contributions,
  });

  final String url;
  final int contributions;

  factory ContributorResponse.fromJson(Map<String, dynamic> data) => _$ContributorResponseFromJson(data);

  Map<String, dynamic> toJson() => _$ContributorResponseToJson(this);
}
