import 'package:nailroom/api/userapi.dart';
import 'package:nailroom/model/user.dart';

class UserRepository{
  Future<bool> registerUser (User user) async{
    return await UserApi().registerUser(user);
  }
  Future<bool> loginUser(String username, String password){
    return UserApi().login(username, password);
  }

  
 }