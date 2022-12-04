import 'package:flutter/cupertino.dart';
import 'package:functional_data/functional_data.dart';

import '../models/contributors/contributor_response.dart';
import '../models/get_repositories/repository_response.dart';
import '../models/user_details/user_details_response.dart';

part 'actions.g.dart';

// ignore_for_file: annotate_overrides

@immutable
class GetRepositoriesLoadingAction {
  const GetRepositoriesLoadingAction({required this.message});

  final String message;
}

@immutable
@FunctionalData()
class GetRepositoriesSuccessAction extends $GetRepositoriesSuccessAction {
  const GetRepositoriesSuccessAction({required this.repositories});

  final List<RepositoryResponse> repositories;
}

@immutable
@FunctionalData()
class GetRepositoriesFailedAction extends $GetRepositoriesFailedAction {
  const GetRepositoriesFailedAction({required this.errorMessage});

  final String errorMessage;
}

@immutable
@FunctionalData()
class SetSelectedRepositoryAction extends $SetSelectedRepositoryAction {
  const SetSelectedRepositoryAction({required this.repositoryID});

  final int repositoryID;
}

@immutable
@FunctionalData()
class GetContributorsLoadingAction extends $GetContributorsLoadingAction {
  const GetContributorsLoadingAction({required this.message});

  final String message;
}

@immutable
@FunctionalData()
class GetContributorsSuccessAction extends $GetContributorsSuccessAction {
  const GetContributorsSuccessAction({
    required this.contributorsResponse,
    required this.usersDetailsResponse,
  });

  final List<ContributorResponse> contributorsResponse;
  final List<UserDetailsResponse> usersDetailsResponse;
}

@immutable
@FunctionalData()
class GetContributorsFailedAction extends $GetContributorsFailedAction {
  const GetContributorsFailedAction({required this.errorMessage});

  final String errorMessage;
}
