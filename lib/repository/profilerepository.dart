import 'package:nailroom/api/userapi.dart';
import 'package:nailroom/model/profile.dart';
import 'package:nailroom/model/user.dart';

class UserRepository {
  Future<bool> registerUser(User user) async {
    return await UserApi().registerUser(user);
  }

  Future<bool> login(String email, String password) {
    return UserApi().login(email, password);
  }

  // Future<UserProfile?> getUserDetails() async {
  //   return await UserApi().getUserDetails();
  // }
}
