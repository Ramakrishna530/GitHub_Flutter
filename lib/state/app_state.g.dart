// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_state.dart';

// **************************************************************************
// FunctionalDataGenerator
// **************************************************************************

abstract class $AppState {
  const $AppState();

  ApiResponse<List<RepositoryResponse>> get repositoriesState;
  RepositoryResponse? get selectedRepository;
  ApiResponse<List<Contributor>> get contributorsState;

  AppState copyWith({
    ApiResponse<List<RepositoryResponse>>? repositoriesState,
    RepositoryResponse? selectedRepository,
    ApiResponse<List<Contributor>>? contributorsState,
  }) =>
      AppState(
        repositoriesState: repositoriesState ?? this.repositoriesState,
        selectedRepository: selectedRepository ?? this.selectedRepository,
        contributorsState: contributorsState ?? this.contributorsState,
      );

  AppState copyUsing(void Function(AppState$Change change) mutator) {
    final change = AppState$Change._(
      this.repositoriesState,
      this.selectedRepository,
      this.contributorsState,
    );
    mutator(change);
    return AppState(
      repositoriesState: change.repositoriesState,
      selectedRepository: change.selectedRepository,
      contributorsState: change.contributorsState,
    );
  }

  @override
  String toString() =>
      "AppState(repositoriesState: $repositoriesState, selectedRepository: $selectedRepository, contributorsState: $contributorsState)";

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  bool operator ==(Object other) =>
      other is AppState &&
      other.runtimeType == runtimeType &&
      const DeepCollectionEquality()
          .equals(repositoriesState, other.repositoriesState) &&
      selectedRepository == other.selectedRepository &&
      const DeepCollectionEquality()
          .equals(contributorsState, other.contributorsState);

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  int get hashCode {
    var result = 17;
    result =
        37 * result + const DeepCollectionEquality().hash(repositoriesState);
    result = 37 * result + selectedRepository.hashCode;
    result =
        37 * result + const DeepCollectionEquality().hash(contributorsState);
    return result;
  }
}

class AppState$Change {
  AppState$Change._(
    this.repositoriesState,
    this.selectedRepository,
    this.contributorsState,
  );

  ApiResponse<List<RepositoryResponse>> repositoriesState;
  RepositoryResponse? selectedRepository;
  ApiResponse<List<Contributor>> contributorsState;
}

// ignore: avoid_classes_with_only_static_members
class AppState$ {
  static final repositoriesState =
      Lens<AppState, ApiResponse<List<RepositoryResponse>>>(
    (repositoriesStateContainer) =>
        repositoriesStateContainer.repositoriesState,
    (repositoriesStateContainer, repositoriesState) =>
        repositoriesStateContainer.copyWith(
            repositoriesState: repositoriesState),
  );

  static final selectedRepository = Lens<AppState, RepositoryResponse?>(
    (selectedRepositoryContainer) =>
        selectedRepositoryContainer.selectedRepository,
    (selectedRepositoryContainer, selectedRepository) =>
        selectedRepositoryContainer.copyWith(
            selectedRepository: selectedRepository),
  );

  static final contributorsState =
      Lens<AppState, ApiResponse<List<Contributor>>>(
    (contributorsStateContainer) =>
        contributorsStateContainer.contributorsState,
    (contributorsStateContainer, contributorsState) =>
        contributorsStateContainer.copyWith(
            contributorsState: contributorsState),
  );
}
