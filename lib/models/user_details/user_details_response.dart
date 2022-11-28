import 'package:json_annotation/json_annotation.dart';

part 'user_details_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class UserDetailsResponse {
  UserDetailsResponse({
    required this.avatarUrl,
    required this.followers,
    this.name,
    this.bio,
    this.company,
  });

  final String avatarUrl;
  final int followers;
  final String? name;
  final String? bio;
  final String? company;

  factory UserDetailsResponse.fromJson(Map<String, dynamic> data) => _$UserDetailsResponseFromJson(data);

  Map<String, dynamic> toJson() => _$UserDetailsResponseToJson(this);
}
