import 'package:git_hub/core/http/http_service.dart';
import 'package:git_hub/repository/contributors/contributors_interface.dart';
import 'package:git_hub/repository/get_repositories/get_repositories_interface.dart';
import 'package:git_hub/repository/user_details/user_details_interface.dart';
import 'package:git_hub/util/dispatcher.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([
  HttpService,
  GetRepositoriesRepo,
  UserDetailsRepository,
  ContributorsRepository,
  Dispatcher,
])
void main() {}
