class Contributor {
  Contributor({
    required this.id,
    required this.contributionsCount,
    required this.avatarUrl,
    required this.followers,
    required this.name,
    required this.bio,
    required this.company,
  });
  final int id;
  final int contributionsCount;
  final String avatarUrl;
  final int followers;
  final String? name;
  final String? bio;
  final String? company;
}
