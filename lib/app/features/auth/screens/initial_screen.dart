import 'package:flutter/material.dart';
import 'package:project_management/app/features/auth/screens/auth_screen.dart';
import 'package:provider/provider.dart';

import 'package:project_management/app/features/dashboard/providers/login_form_provider.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Center(
        child: Column(
          children: [
            Container(
                margin: const EdgeInsets.only(top: 100),
                width: 200,
                height: 100,
                color: Colors.white,
                child: Image.asset("assets/images/raster/logouteam.png")),
            Container(
              margin: const EdgeInsets.only(top: 70),
              width: 250,
              height: 80,
              color: Colors.white,
              child: const Text(
                "Bienvenido administrador",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff5D4FB1)),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 0),
              width: 250,
              height: 80,
              color: Colors.white,
              child: const Text(
                "Inicia sesión para administrar",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff5D4FB1)),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Column(children: [
              ChangeNotifierProvider(
                  create: (_) => LoginFormProvider(),
                  child: _InitialScreenForm())
            ]),
          ],
        ),
      )),
    );
  }
}

class _InitialScreenForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);
    return Form(
        key: loginForm.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  disabledColor: Colors.grey,
                  elevation: 0,
                  color: Colors.deepPurple,
                  child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
                      child: const Text(
                        'Comenzar',
                        style: TextStyle(color: Colors.white),
                      )),
                  onPressed: () {
                    //if (!loginForm.isValidForm()) return;
                    Navigator.pushNamed(context, AuthScreen.route);
                  }),
              // MaterialButton(
              //     shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(10)),
              //     disabledColor: Colors.grey,
              //     elevation: 0,
              //     color: Color.fromARGB(255, 218, 179, 231),
              //     child: Container(
              //         padding: const EdgeInsets.symmetric(
              //             horizontal: 20, vertical: 15),
              //         child: const Text(
              //           'Log in',
              //           style: TextStyle(
              //             color: Color(0xff5D4FB1),
              //           ),
              //         )),
              //     onPressed: () {
              //       if (!loginForm.isValidForm()) return;
              //       Navigator.pushReplacementNamed(context, 'login');
              //     })
            ],
          ),
        ));
  }
}
