import 'package:flutter/foundation.dart';

import '../core/http/api_response.dart';
import '../models/contributors/contributor_response.dart';
import '../models/user_details/user_details_response.dart';
import '../repository/contributors/contributors.dart';
import '../repository/contributors/contributors_interface.dart';
import '../repository/user_details/user_details.dart';
import '../repository/user_details/user_details_interface.dart';

abstract class ContributorsProvider implements Listenable {
  Future<void> getContributorsDetail({required String repositoryFullName});
  ApiResponse<List<UserDetailsResponse>> get contributors;
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
  ApiResponse<List<UserDetailsResponse>> get contributors => _contributors;

  ApiResponse<List<UserDetailsResponse>> _contributors = ApiResponse.loading();

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
    final userDetailsFutures = contributorsResponse
        .map((contributorResponse) => userDetailsRepository.getUserDetails(contributorResponse.url));
    final results = await Future.wait(userDetailsFutures);
    _setContributorsState(state: ApiResponse.completed(results));
  }

  void _setContributorsState({required ApiResponse<List<UserDetailsResponse>> state}) {
    _contributors = state;
    notifyListeners();
  }
}
