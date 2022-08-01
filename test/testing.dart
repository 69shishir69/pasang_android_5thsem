import 'package:flutter_test/flutter_test.dart';
import 'package:nailroom/model/user.dart';
import 'package:nailroom/repository/userrepository.dart';

void main () {
  late UserRepository? userRepository;


  setUp(() {
    userRepository = UserRepository();

  });

  group("User testing", (){
    test ('user registration', () async {
      bool expectedResult = true;
      User user = User(
        Email: "tenzin@gmail.com",
        Username : "tenzin",
        Password : "tenzin",
        );

      bool actualResult = await UserRepository().registerUser(user);

      expect (expectedResult, actualResult);

      
    });

    test ('user login', () async {
      bool expectedResult = true;
      String Username ="tenzin@gmail.com";
      String Password ="tenzin";
      

      bool actualResult = await UserRepository().loginUser(Username,Password);

      expect (expectedResult, actualResult);
    });
  });
  
}