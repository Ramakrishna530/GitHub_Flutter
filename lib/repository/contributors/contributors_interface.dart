import '../../models/contributors/contributor_response.dart';

abstract class ContributorsRepository {
  Future<List<ContributorResponse>> getContributors({
    required String repositoryFullName,
  });
}
