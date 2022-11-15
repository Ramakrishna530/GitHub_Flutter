class Repository {
  final String id;
  final String name;
  final String fullName;
  final String avatarURL;
  final String license;

  Repository({
    required this.id,
    required this.name,
    required this.fullName,
    required this.avatarURL,
    required this.license,
  });

  factory Repository.fromJson(Map<String, Object> json) => Repository(
        id: json["id"] as String,
        name: json["name"] as String,
        fullName: json["full_name"] as String,
        avatarURL:
            (json["owner"] as Map<String, Object>)["avatar_url"] as String,
        license: (json["license"] as Map<String, Object>)["name"] as String,
      );
}
