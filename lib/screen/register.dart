import 'package:flutter/material.dart';
import 'package:nailroom/model/user.dart';
import 'package:nailroom/repository/userrepository.dart';
import 'package:nailroom/utils/showmessage.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _firstnameController = TextEditingController();
  final _lastnameController = TextEditingController();
  // final _ageController = TextEditingController();
  // final _locatinController = TextEditingController();
  // final _DateController = TextEditingController();
  final _phonenumberController = TextEditingController();

  _registerUser(User user) async {
    bool isSignup = await UserRepository().registerUser(user);
    print(isSignup);
    if (isSignup) {
      _displayMessage(true);
    } else {
      _displayMessage(false);
    }
  }

  _displayMessage(bool isSignup) {
    if (isSignup) {
      displaySuccessMessage(context, "Register Successfully");
    } else {
      displayErrorMessage(context, "Register failed");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color.fromARGB(255, 236, 226, 220),
      appBar: AppBar(
        title: const Text("Register here"),
        backgroundColor: const Color.fromARGB(255, 30, 152, 208),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(
                      height: 300,
                      width: 200,
                      child: CircleAvatar(
                          backgroundImage: AssetImage("assets/image/lemon.png"))),
                  Container(),
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      hintText: "Enter your email address",
                      labelText: "Email ",
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "required";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _firstnameController,
                    decoration: const InputDecoration(
                      hintText: "Enter your first name",
                      labelText: "FirstName",
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
                    controller: _lastnameController,
                    decoration: const InputDecoration(
                      hintText: "Enter your last name",
                      labelText: "Lastname",
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
                    controller: _usernameController,
                    decoration: const InputDecoration(
                      hintText: "Enter your full name",
                      labelText: "Username",
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
                    controller: _phonenumberController,
                    decoration: const InputDecoration(
                      hintText: "Enter your phone number",
                      labelText: "Phone number",
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
                    controller: _passwordController,
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
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {

                        User user = User(
                          Email: _emailController.text,
                          Username: _usernameController.text,
                          Password: _passwordController.text,
                          Firstname: _firstnameController.text,
                          Lastname: _lastnameController.text,
                        );
                        _registerUser(user);
                      }

                    },
                    // child: Container(
                    //   padding: const EdgeInsets.only(right: 20, top: 2),
                    //   height: 50.0,
                    //   width: 135.0,
                    //   decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(15),
                    //       color: const Color.fromARGB(248, 41, 136, 215)),
                    //   child: Container(
                    //       padding: const EdgeInsets.only(left: 20, top: 0),
                    //       child: const Center(
                    //           child: Text('SUBMIT',
                    //               style: TextStyle(
                    //                   fontFamily: 'nunito',
                    //                   fontSize: 20.0,
                    //                   fontWeight: FontWeight.bold,
                    //                   color: Colors.white)))
                    //                   ),
                    // ),
                    

                        child: const Text(

                          'Register',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 220, 197, 197),

                          ),
                        ),
                      ),

                    const SizedBox(height: 20,),

                  //   SizedBox(
                  //     width: double.infinity,
                  //     child: ElevatedButton(
                  //       child: const Text("Register"),
                  //       onPressed: (){
                  //         Navigator.pushNamed(context, '/');
                  //       },
                  //       ),
                  // ),
                  
                  
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
