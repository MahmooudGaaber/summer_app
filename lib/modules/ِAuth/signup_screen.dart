import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:summer_app/models/user/userdata_model.dart';
import 'package:summer_app/modules/%D9%90Auth/login_screen.dart';
import 'package:summer_app/shared/app_style.dart';
import 'package:summer_app/shared/firebase_methods.dart';
import '../bottom_navi.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController sighupEmailController = TextEditingController();
  TextEditingController signupPasswordController = TextEditingController();
  TextEditingController sighupFirstNameController = TextEditingController();
  TextEditingController sighupLastNameController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  // final userData = FirebaseDatabase.instance.ref().child("Users").push();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                defaultIconButton(
                  press: () {
                    Navigator.pop(context);
                  },
                  buttonColor: Colors.white,
                  buttonIcon: Icons.keyboard_arrow_left,
                  buttonIconColor: lightText,
                  buttonIconSize: 30.0,
                ),
                Row(
                  children: const [
                    Spacer(),
                    Text(
                      "Sign Up",
                      style: TextStyle(
                        fontFamily: 'Metropolis_Black',
                        color: tittleTextColor,
                        fontSize: 28.0,
                      ),
                    ),
                    Spacer(),
                  ],
                ),
                const SizedBox(
                  height: 30.0,
                ),
                defaultMaterialButton(
                  buttonColor: Colors.blue,
                  buttonPadding: const EdgeInsets.symmetric(horizontal: 30.0),
                  buttonText: 'Login With Facebook',
                  press: () {
                    defaultNavigator(
                        context: context, page: const LoginScreen());
                  },
                  buttonTextColor: Colors.white,
                ),
                const SizedBox(
                  height: 15.0,
                ),
                defaultMaterialButton(
                  buttonColor: Colors.red,
                  buttonPadding: const EdgeInsets.symmetric(horizontal: 30.0),
                  buttonText: 'Login With Google',
                  press: () {
                    defaultNavigator(
                        context: context, page: const LoginScreen());
                  },
                  buttonTextColor: Colors.white,
                ),
                const SizedBox(
                  height: 25.0,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Spacer(),
                    Text(
                      "or Login With Email",
                      style: TextStyle(
                        color: headText,
                      ),
                    ),
                    Spacer(),
                  ],
                ),
                const SizedBox(
                  height: 25.0,
                ),
                defaultTextField(
                  controller: sighupFirstNameController,
                  fillColor: Colors.white,
                  hintText: 'First Name',
                  keyboardType: TextInputType.name,
                  isPassword: false,
                  iconButtonPadding:
                      const EdgeInsets.symmetric(horizontal: 30.0),
                  hintStyle: const TextStyle(
                    color: headText,
                    fontFamily: metropolisRegular,
                    fontSize: 14.0,
                  ),
                  bordColor: headText,
                  textFieldValidator: (value) {
                    if (value.isEmpty ||
                        !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                      return "Enter Right Name Form";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20.0,
                ),
                defaultTextField(
                  controller: sighupLastNameController,
                  fillColor: Colors.white,
                  keyboardType: TextInputType.name,
                  hintText: 'Last Name',
                  isPassword: false,
                  iconButtonPadding:
                      const EdgeInsets.symmetric(horizontal: 30.0),
                  hintStyle: const TextStyle(
                    color: headText,
                    fontFamily: metropolisRegular,
                    fontSize: 14.0,
                  ),
                  bordColor: headText,
                  textFieldValidator: (value) {
                    if (value.isEmpty ||
                        !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                      return "Enter Right Name Form";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20.0,
                ),
                defaultTextField(
                  controller: sighupEmailController,
                  fillColor: Colors.white,
                  keyboardType: TextInputType.emailAddress,
                  hintText: 'Email',
                  isPassword: false,
                  iconButtonPadding:
                      const EdgeInsets.symmetric(horizontal: 30.0),
                  hintStyle: const TextStyle(
                    color: headText,
                    fontFamily: metropolisRegular,
                    fontSize: 14.0,
                  ),
                  bordColor: headText,
                  textFieldValidator: (value) {
                    if (value.isEmpty ||
                        !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                            .hasMatch(value)) {
                      return "Enter Right Email Form";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20.0,
                ),
                defaultTextField(
                  controller: signupPasswordController,
                  fillColor: Colors.white,
                  keyboardType: null,
                  hintText: 'Password',
                  isPassword: true,
                  iconButtonPadding:
                      const EdgeInsets.symmetric(horizontal: 30.0),
                  hintStyle: const TextStyle(
                    color: headText,
                    fontFamily: metropolisRegular,
                    fontSize: 14.0,
                  ),
                  bordColor: headText,
                  textFieldValidator: (value) {
                    if (value.isEmpty) {
                      return "Password is Empty";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 50.0,
                ),
                defaultMaterialButton(
                  buttonColor: primaryColor,
                  buttonPadding: const EdgeInsets.symmetric(horizontal: 30.0),
                  buttonText: 'Sign Up',
                  buttonTextColor: Colors.white,
                  press: () async {
                    if (formKey.currentState!.validate())
                    {
                      try
                      {
                      FireBaseMethods().signup(sighupFirstNameController.text, signupPasswordController.text, sighupEmailController.text);
                      FireBaseMethods().getHotelData();
                      FireBaseMethods().getSearchData() ;
                      FireBaseMethods().signupDone(
                        context: context,
                        page: const BottomNavi(),
                      );

                      } on FirebaseAuthException catch (e)
                      {
                        FireBaseMethods().gettingError(
                          context : context ,
                          page  : const SignupScreen() ,
                        );
                      }
                    }
                  },
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          const Text(
                            "Already have account?",
                            style: TextStyle(
                              color: headText,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              defaultNavigator(
                                context: context,
                                page: const LoginScreen(),
                              );
                            },
                            child: const Text(
                              " Login",
                              style: TextStyle(
                                color: primaryColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
