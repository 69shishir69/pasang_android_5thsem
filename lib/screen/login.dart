import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:nailroom/repository/userrepository.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _password = TextEditingController();

  _navigateToScreen(bool isLogin) {
    if (isLogin) {
      Navigator.pushReplacementNamed(context, '/bottomnav');
    } else {
      MotionToast.error(description: const Text("Invalid user credentials"))
          .show(context);
    }
  }

  _login() async {
    try {
      UserRepository userRepository = UserRepository();
      bool isLogin = await userRepository.loginUser(
        _email.text,
        _password.text,
      );
      _navigateToScreen(isLogin);
    } catch (e) {
      MotionToast.error(description: Text("Error: ${e.toString()}"))
          .show(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(159, 201, 221, 1), 
        body: SafeArea(
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(children: [
                  const SizedBox(
                      height: 300,
                      width: 200,
                      child: CircleAvatar(
                          backgroundImage: AssetImage("assets/image/lemon.png"))),
                  TextFormField(
                    key: const ValueKey('email'),
                    controller: _email,
                    decoration: const InputDecoration(
                      hintText: "Enter your email",
                      labelText: "Email",
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "required";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                     key: const ValueKey('password'),
                    controller: _password,
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: "Enter your password",
                      labelText: "Password",
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "required";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                       key: const ValueKey('Loginbutton'),
                      child: const Text("Login"),
                      onPressed: () {
                        // Navigator.pushNamed(context, '/dashboard');
                        if (_formKey.currentState!.validate()) {
                          _login(
                           
                          );
                        }
                      },
                    ),
                  ),
                  const SizedBox(height:8),
                  GestureDetector(
                    onTap: (){},
                    child: const Text("Forgot password?",style: TextStyle(
                      color: Colors.blue,
                    ),)
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    const Text("New to NailRoom? "),
                    GestureDetector(
                    onTap: (){
                        Navigator.pushNamed(context, '/register');
                    },
                    child: const Text("SignUp here", style: TextStyle(color: Colors.blue),),
                  ),
                  ],),
                ]),
              ),
            ),
          ),
        ));
  }
}
