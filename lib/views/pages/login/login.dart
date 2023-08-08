import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:ideamagix_ecommerce_flutter_app/utils/constants.dart';
import 'package:ideamagix_ecommerce_flutter_app/utils/waveclipper.dart';
import 'package:ideamagix_ecommerce_flutter_app/controllers/auth.controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final username = TextEditingController();
  final password = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final AuthController authController = Get.put(AuthController());
  bool passwordHide = true;

  submit() async {
    print('login');
    await authController.login(
        username: username.text,
        password: password.text,
        onLogin: () {
          Get.offAllNamed('/products');
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomPadding: false,

      resizeToAvoidBottomInset: false,
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipPath(
            clipper: WaveClipper1(),
            child: Container(
              color: red,
              height: screenHeight * 0.25,
            ),
            // ),
          ),
          Text(
            "LOG IN",
            style: blackBoldTextStyle,
          ),
          Form(
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: width10 * 2.2),
              child: Column(
                children: [
                  TextFormField(
                    controller: username,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) => (value == null || value.isEmpty) ? 'Username $empty' : null,
                    decoration: InputDecoration(
                      suffixIcon: Icon(
                        Icons.person_outline,
                        color: black,
                      ),
                      hintText: 'Username',
                    ),
                  ),
                  TextFormField(
                    controller: password,
                    obscureText: passwordHide ? true : false,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) => (value == null || value.isEmpty) ? 'Password $empty' : null,
                    decoration: InputDecoration(
                      suffixIcon: passwordHide
                          ? IconButton(
                              icon: Icon(Icons.visibility_off),
                              onPressed: () => setState(() => passwordHide = false),
                              color: black,
                            )
                          : IconButton(
                              icon: Icon(Icons.visibility),
                              onPressed: () => setState(() => passwordHide = true),
                              color: black,
                            ),
                      hintText: 'Password',
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50.0, right: 20),
            child: ElevatedButton(
                onPressed: submit,
                // onPressed: () {
                //   // Get.offNamed('/products');
                //      _formKey.currentState!.validate()
                //    ? {
                //       // wc.passwordInput.value = true,
                //       // print(wc.passwordInput.value)
                //     }
                //   : {
                //       // wc.passwordInput.value = false,
                //       // print(wc.passwordInput.value)
                //   };

                //   // username.text.isNotEmpty || password.text.isNotEmpty ? ac.login(username.text, password.text) : print("Login Details $empty");
                // },
                style: blackButtonStyle,
                child: Text(
                  "SUBMIT",
                  style: whiteTextStyle,
                )),
          ),
          ClipPath(
            clipper: WaveClipper2(),
            child: Container(
              color: red,
              width: screenWidth,
              height: screenHeight * 0.25,
            ),
            // ),
          ),
        ],
      ),
    );
  }
}
