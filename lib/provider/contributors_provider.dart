import 'package:flutter/foundation.dart';

import '../core/http/api_response.dart';
import '../models/contributors/contributor_response.dart';
import '../models/user_details/user_details_response.dart';
import '../repository/contributors/contributors.dart';
import '../repository/contributors/contributors_interface.dart';
import '../repository/user_details/user_details.dart';
import '../repository/user_details/user_details_interface.dart';
import 'contributor.dart';

abstract class ContributorsProvider implements Listenable {
  Future<void> getContributorsDetail({required String repositoryFullName});
  ApiResponse<List<Contributor>> get contributors;
}

class ContributorsProviderImpl extends ChangeNotifier implements ContributorsProvider {
  ContributorsProviderImpl({
    ContributorsRepository? contributorsRepository,
    UserDetailsRepository? userDetailsRepository,
  })  : contributorsRepository = contributorsRepository ?? ContributorsRepositoryImpl(),
        userDetailsRepository = userDetailsRepository ?? UserDetailsRepositoryImpl();
  ContributorsRepository contributorsRepository;
  UserDetailsRepository userDetailsRepository;
  @override
  ApiResponse<List<Contributor>> get contributors => _contributors;

  ApiResponse<List<Contributor>> _contributors = ApiResponse.loading();

  @override
  Future<void> getContributorsDetail({required String repositoryFullName}) async {
    _setContributorsState(state: ApiResponse.loading());
    try {
      final response = await contributorsRepository.getContributors(repositoryFullName: repositoryFullName);
      await _getContributorsDetails(response);
    } on Exception catch (error) {
      _setContributorsState(
        state: ApiResponse.error(error.toString()),
      );
    }
  }

  Future<void> _getContributorsDetails(List<ContributorResponse> contributorsResponse) async {
    final userDetailsFutures = contributorsResponse.map(
      (contributorResponse) => userDetailsRepository.getUserDetails(contributorResponse.url),
    );
    final results = await Future.wait(userDetailsFutures);
    final contributors = _createContributors(results, contributorsResponse);
    _setContributorsState(state: ApiResponse.completed(contributors));
  }

  List<Contributor> _createContributors(
    List<UserDetailsResponse> userDetailsResponse,
    List<ContributorResponse> contributorsResponse,
  ) {
    final contributors = <Contributor>[];
    userDetailsResponse.forEach((userDetails) {
      final contributorResponse =
          contributorsResponse.firstWhere((contributorResponse) => contributorResponse.id == userDetails.id);
      final contributor = Contributor(
        id: userDetails.id,
        contributionsCount: contributorResponse.contributions,
        avatarUrl: userDetails.avatarUrl,
        followers: userDetails.followers,
        name: userDetails.name,
        bio: userDetails.bio,
        company: userDetails.company,
      );
      contributors.add(contributor);
    });
    return contributors;
  }

  void _setContributorsState({required ApiResponse<List<Contributor>> state}) {
    _contributors = state;
    notifyListeners();
  }
}
