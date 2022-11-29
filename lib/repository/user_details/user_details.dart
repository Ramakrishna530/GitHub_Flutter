import '../../core/http/http_service.dart';
import '../../models/user_details/user_details_response.dart';
import 'user_details_interface.dart';

class UserDetailsRepositoryImpl implements UserDetailsRepository {
  UserDetailsRepositoryImpl({HttpService? httpService}) : httpService = httpService ?? HttpServiceImpl();

  final HttpService httpService;
  @override
  Future<UserDetailsResponse> getUserDetails({required String url}) async {
    final uri = Uri.parse(url);
    final response = await httpService.getResponse(uri) as Map<String, dynamic>;
    final userDetailsResponse = UserDetailsResponse.fromJson(response);
    return userDetailsResponse;
  }
}
