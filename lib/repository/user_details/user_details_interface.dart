import '../../models/user_details/user_details_response.dart';

abstract class UserDetailsRepository {
  Future<UserDetailsResponse> getUserDetails({required String url});
}
