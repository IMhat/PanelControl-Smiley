import 'package:project_management/app/common/widgets/custom_button.dart';
import 'package:project_management/app/common/widgets/custom_textField.dart';

import 'package:project_management/app/constans/global_variables.dart';

import 'package:flutter/material.dart';
import 'package:project_management/app/features/auth/services/auth_service.dart';

enum Auth {
  signin,
  signup,
}

class AuthScreen extends StatefulWidget {
  static const String route = '/auth-screen';

  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.signup;
  final _signUpFormKey = GlobalKey<FormState>();
  final _signInFormKey = GlobalKey<FormState>();

  final AuthService authService = AuthService();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _nameController.dispose();
    _passwordController.dispose();
  }

  void signUpUser() {
    authService.signUpUser(
        context: context,
        email: _emailController.text,
        password: _passwordController.text,
        name: _nameController.text);
  }

  void signInUser() {
    authService.signInUser(
      context: context,
      email: _emailController.text,
      password: _passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                  top: 150,
                ),
                child: Text(
                  "Admin",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 40),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 10,
                ),
                width: 350,
                height: 500,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Color(0xff48409E),
                    boxShadow: const [
                      BoxShadow(
                          color: Color.fromARGB(134, 196, 195, 195),
                          blurRadius: 10.0,
                          offset: Offset(0, 5)),
                      BoxShadow(
                        color: Color.fromARGB(255, 233, 232, 232),
                      ),
                    ]),
                child: SafeArea(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // ListTile(
                      //   tileColor: _auth == Auth.signup
                      //       ? GlobalVariables.authBackgroundColor
                      //       : GlobalVariables.greyBackgroundCOlor,
                      //   title: const Text(
                      //     'Crear una cuenta',
                      //     style: TextStyle(fontWeight: FontWeight.bold),
                      //   ),
                      //   leading: Radio(
                      //     activeColor: GlobalVariables.secondaryColor,
                      //     value: Auth.signup,
                      //     groupValue: _auth,
                      //     onChanged: (Auth? val) {
                      //       setState(() {
                      //         _auth = val!;
                      //       });
                      //     },
                      //   ),
                      // ),
                      if (_auth == Auth.signup)
                        Container(
                          margin: EdgeInsets.only(top: 30),
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color.fromARGB(255, 39, 38, 38),
                              boxShadow: const [
                                BoxShadow(
                                    color: Color.fromARGB(134, 196, 195, 195),
                                    blurRadius: 10.0,
                                    offset: Offset(0, 5)),
                                BoxShadow(
                                  color: Color.fromARGB(255, 233, 232, 232),
                                ),
                              ]),
                          child: Form(
                            key: _signUpFormKey,
                            child: Column(
                              children: [
                                // CustomTextField(
                                //   controller: _nameController,
                                //   hintText: 'Name',
                                // ),
                                const SizedBox(
                                  height: 50,
                                ),
                                CustomTextField(
                                  controller: _emailController,
                                  hintText: 'Email',
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                CustomTextField(
                                  controller: _passwordController,
                                  hintText: 'Password',
                                ),
                                const SizedBox(
                                  height: 80,
                                ),
                                CustomButton(
                                  text: 'Sign Up',
                                  onTap: () {
                                    if (_signUpFormKey.currentState!
                                        .validate()) {
                                      signUpUser();
                                    }
                                  },
                                )
                              ],
                            ),
                          ),
                        ),
                      ListTile(
                        tileColor: _auth == Auth.signin
                            ? GlobalVariables.authBackgroundColor
                            : GlobalVariables.greyBackgroundCOlor,
                        title: const Text(
                          'Iniciar Sesion',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        leading: Radio(
                          activeColor: GlobalVariables.secondaryColor,
                          value: Auth.signin,
                          groupValue: _auth,
                          onChanged: (Auth? val) {
                            setState(() {
                              _auth = val!;
                            });
                          },
                        ),
                      ),
                      if (_auth == Auth.signin)
                        Container(
                          padding: const EdgeInsets.all(8),
                          color: Color.fromARGB(255, 39, 38, 38),
                          child: Form(
                            key: _signInFormKey,
                            child: Column(
                              children: [
                                CustomTextField(
                                  controller: _emailController,
                                  hintText: 'Email',
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                CustomTextField(
                                  controller: _passwordController,
                                  hintText: 'Password',
                                ),
                                Container(
                                  margin: const EdgeInsets.only(left: 90),
                                  child: TextButton(
                                      onPressed: () {},
                                      child: const Text(
                                          "olvidaste la contraseña?")),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                CustomButton(
                                    text: 'Sign In',
                                    onTap: () {
                                      if (_signInFormKey.currentState!
                                          .validate()) {
                                        signInUser();
                                      }
                                    })
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
