// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'actions.dart';

// **************************************************************************
// FunctionalDataGenerator
// **************************************************************************

abstract class $GetRepositoriesSuccessAction {
  const $GetRepositoriesSuccessAction();

  List<RepositoryResponse> get repositories;

  GetRepositoriesSuccessAction copyWith({
    List<RepositoryResponse>? repositories,
  }) =>
      GetRepositoriesSuccessAction(
        repositories: repositories ?? this.repositories,
      );

  GetRepositoriesSuccessAction copyUsing(
      void Function(GetRepositoriesSuccessAction$Change change) mutator) {
    final change = GetRepositoriesSuccessAction$Change._(
      this.repositories,
    );
    mutator(change);
    return GetRepositoriesSuccessAction(
      repositories: change.repositories,
    );
  }

  @override
  String toString() =>
      "GetRepositoriesSuccessAction(repositories: $repositories)";

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  bool operator ==(Object other) =>
      other is GetRepositoriesSuccessAction &&
      other.runtimeType == runtimeType &&
      repositories == other.repositories;

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  int get hashCode {
    return repositories.hashCode;
  }
}

class GetRepositoriesSuccessAction$Change {
  GetRepositoriesSuccessAction$Change._(
    this.repositories,
  );

  List<RepositoryResponse> repositories;
}

// ignore: avoid_classes_with_only_static_members
class GetRepositoriesSuccessAction$ {
  static final repositories =
      Lens<GetRepositoriesSuccessAction, List<RepositoryResponse>>(
    (repositoriesContainer) => repositoriesContainer.repositories,
    (repositoriesContainer, repositories) =>
        repositoriesContainer.copyWith(repositories: repositories),
  );
}

abstract class $GetRepositoriesFailedAction {
  const $GetRepositoriesFailedAction();

  String get errorMessage;

  GetRepositoriesFailedAction copyWith({
    String? errorMessage,
  }) =>
      GetRepositoriesFailedAction(
        errorMessage: errorMessage ?? this.errorMessage,
      );

  GetRepositoriesFailedAction copyUsing(
      void Function(GetRepositoriesFailedAction$Change change) mutator) {
    final change = GetRepositoriesFailedAction$Change._(
      this.errorMessage,
    );
    mutator(change);
    return GetRepositoriesFailedAction(
      errorMessage: change.errorMessage,
    );
  }

  @override
  String toString() =>
      "GetRepositoriesFailedAction(errorMessage: $errorMessage)";

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  bool operator ==(Object other) =>
      other is GetRepositoriesFailedAction &&
      other.runtimeType == runtimeType &&
      errorMessage == other.errorMessage;

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  int get hashCode {
    return errorMessage.hashCode;
  }
}

class GetRepositoriesFailedAction$Change {
  GetRepositoriesFailedAction$Change._(
    this.errorMessage,
  );

  String errorMessage;
}

// ignore: avoid_classes_with_only_static_members
class GetRepositoriesFailedAction$ {
  static final errorMessage = Lens<GetRepositoriesFailedAction, String>(
    (errorMessageContainer) => errorMessageContainer.errorMessage,
    (errorMessageContainer, errorMessage) =>
        errorMessageContainer.copyWith(errorMessage: errorMessage),
  );
}

abstract class $SetSelectedRepositoryAction {
  const $SetSelectedRepositoryAction();

  int get repositoryID;

  SetSelectedRepositoryAction copyWith({
    int? repositoryID,
  }) =>
      SetSelectedRepositoryAction(
        repositoryID: repositoryID ?? this.repositoryID,
      );

  SetSelectedRepositoryAction copyUsing(
      void Function(SetSelectedRepositoryAction$Change change) mutator) {
    final change = SetSelectedRepositoryAction$Change._(
      this.repositoryID,
    );
    mutator(change);
    return SetSelectedRepositoryAction(
      repositoryID: change.repositoryID,
    );
  }

  @override
  String toString() =>
      "SetSelectedRepositoryAction(repositoryID: $repositoryID)";

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  bool operator ==(Object other) =>
      other is SetSelectedRepositoryAction &&
      other.runtimeType == runtimeType &&
      repositoryID == other.repositoryID;

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  int get hashCode {
    return repositoryID.hashCode;
  }
}

class SetSelectedRepositoryAction$Change {
  SetSelectedRepositoryAction$Change._(
    this.repositoryID,
  );

  int repositoryID;
}

// ignore: avoid_classes_with_only_static_members
class SetSelectedRepositoryAction$ {
  static final repositoryID = Lens<SetSelectedRepositoryAction, int>(
    (repositoryIDContainer) => repositoryIDContainer.repositoryID,
    (repositoryIDContainer, repositoryID) =>
        repositoryIDContainer.copyWith(repositoryID: repositoryID),
  );
}

abstract class $GetContributorsLoadingAction {
  const $GetContributorsLoadingAction();

  String get message;

  GetContributorsLoadingAction copyWith({
    String? message,
  }) =>
      GetContributorsLoadingAction(
        message: message ?? this.message,
      );

  GetContributorsLoadingAction copyUsing(
      void Function(GetContributorsLoadingAction$Change change) mutator) {
    final change = GetContributorsLoadingAction$Change._(
      this.message,
    );
    mutator(change);
    return GetContributorsLoadingAction(
      message: change.message,
    );
  }

  @override
  String toString() => "GetContributorsLoadingAction(message: $message)";

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  bool operator ==(Object other) =>
      other is GetContributorsLoadingAction &&
      other.runtimeType == runtimeType &&
      message == other.message;

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  int get hashCode {
    return message.hashCode;
  }
}

class GetContributorsLoadingAction$Change {
  GetContributorsLoadingAction$Change._(
    this.message,
  );

  String message;
}

// ignore: avoid_classes_with_only_static_members
class GetContributorsLoadingAction$ {
  static final message = Lens<GetContributorsLoadingAction, String>(
    (messageContainer) => messageContainer.message,
    (messageContainer, message) => messageContainer.copyWith(message: message),
  );
}

abstract class $GetContributorsSuccessAction {
  const $GetContributorsSuccessAction();

  List<ContributorResponse> get contributorsResponse;
  List<UserDetailsResponse> get usersDetailsResponse;

  GetContributorsSuccessAction copyWith({
    List<ContributorResponse>? contributorsResponse,
    List<UserDetailsResponse>? usersDetailsResponse,
  }) =>
      GetContributorsSuccessAction(
        contributorsResponse: contributorsResponse ?? this.contributorsResponse,
        usersDetailsResponse: usersDetailsResponse ?? this.usersDetailsResponse,
      );

  GetContributorsSuccessAction copyUsing(
      void Function(GetContributorsSuccessAction$Change change) mutator) {
    final change = GetContributorsSuccessAction$Change._(
      this.contributorsResponse,
      this.usersDetailsResponse,
    );
    mutator(change);
    return GetContributorsSuccessAction(
      contributorsResponse: change.contributorsResponse,
      usersDetailsResponse: change.usersDetailsResponse,
    );
  }

  @override
  String toString() =>
      "GetContributorsSuccessAction(contributorsResponse: $contributorsResponse, usersDetailsResponse: $usersDetailsResponse)";

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  bool operator ==(Object other) =>
      other is GetContributorsSuccessAction &&
      other.runtimeType == runtimeType &&
      contributorsResponse == other.contributorsResponse &&
      usersDetailsResponse == other.usersDetailsResponse;

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  int get hashCode {
    var result = 17;
    result = 37 * result + contributorsResponse.hashCode;
    result = 37 * result + usersDetailsResponse.hashCode;
    return result;
  }
}

class GetContributorsSuccessAction$Change {
  GetContributorsSuccessAction$Change._(
    this.contributorsResponse,
    this.usersDetailsResponse,
  );

  List<ContributorResponse> contributorsResponse;
  List<UserDetailsResponse> usersDetailsResponse;
}

// ignore: avoid_classes_with_only_static_members
class GetContributorsSuccessAction$ {
  static final contributorsResponse =
      Lens<GetContributorsSuccessAction, List<ContributorResponse>>(
    (contributorsResponseContainer) =>
        contributorsResponseContainer.contributorsResponse,
    (contributorsResponseContainer, contributorsResponse) =>
        contributorsResponseContainer.copyWith(
            contributorsResponse: contributorsResponse),
  );

  static final usersDetailsResponse =
      Lens<GetContributorsSuccessAction, List<UserDetailsResponse>>(
    (usersDetailsResponseContainer) =>
        usersDetailsResponseContainer.usersDetailsResponse,
    (usersDetailsResponseContainer, usersDetailsResponse) =>
        usersDetailsResponseContainer.copyWith(
            usersDetailsResponse: usersDetailsResponse),
  );
}

abstract class $GetContributorsFailedAction {
  const $GetContributorsFailedAction();

  String get errorMessage;

  GetContributorsFailedAction copyWith({
    String? errorMessage,
  }) =>
      GetContributorsFailedAction(
        errorMessage: errorMessage ?? this.errorMessage,
      );

  GetContributorsFailedAction copyUsing(
      void Function(GetContributorsFailedAction$Change change) mutator) {
    final change = GetContributorsFailedAction$Change._(
      this.errorMessage,
    );
    mutator(change);
    return GetContributorsFailedAction(
      errorMessage: change.errorMessage,
    );
  }

  @override
  String toString() =>
      "GetContributorsFailedAction(errorMessage: $errorMessage)";

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  bool operator ==(Object other) =>
      other is GetContributorsFailedAction &&
      other.runtimeType == runtimeType &&
      errorMessage == other.errorMessage;

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  int get hashCode {
    return errorMessage.hashCode;
  }
}

class GetContributorsFailedAction$Change {
  GetContributorsFailedAction$Change._(
    this.errorMessage,
  );

  String errorMessage;
}

// ignore: avoid_classes_with_only_static_members
class GetContributorsFailedAction$ {
  static final errorMessage = Lens<GetContributorsFailedAction, String>(
    (errorMessageContainer) => errorMessageContainer.errorMessage,
    (errorMessageContainer, errorMessage) =>
        errorMessageContainer.copyWith(errorMessage: errorMessage),
  );
}
