import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:summer_app/modules/login_screen/login_screen.dart';
import 'package:summer_app/shared/app_style.dart';

class SignupScreen extends StatefulWidget
{
  const SignupScreen({Key? key}) : super(key: key);
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen>
{
  TextEditingController sighupEmailController = TextEditingController();
  TextEditingController signupPasswordController = TextEditingController();
  TextEditingController sighupFirstNameController = TextEditingController();
  TextEditingController sighupLastNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              defaultIconButton(
                press: (){},
                buttonColor: Colors.white,
                buttonIcon:  Icons.keyboard_arrow_left,
                buttonIconColor: lightText ,
                buttonIconSize: 30.0,
              ),

              Row(
                children:  const [
                  Spacer(),
                  Text(
                    "Sign Up" ,
                    style: TextStyle(
                      fontFamily: 'Metropolis_Black',
                      color: tittleTextColor,
                      fontSize: 28.0,
                    ),
                  ),
                  Spacer(),
                ],
              ),

              const SizedBox(height: 30.0,),

              defaultMaterialButton(
                buttonColor: Colors.blue,
                buttonPadding: const EdgeInsets.symmetric(horizontal: 30.0),
                buttonText: 'Login With Facebook',
                press: (){
                  defaultNavigator(
                      context:context,
                      page : const LoginScreen()
                  );
                },
                buttonTextColor: Colors.white,
              ),

              const SizedBox(height: 15.0,),

              defaultMaterialButton(
                buttonColor: Colors.red,
                buttonPadding: const EdgeInsets.symmetric(horizontal: 30.0),
                buttonText: 'Login With Google',
                press: (){
                  defaultNavigator(
                      context:context,
                      page : const LoginScreen()
                  );
                },
                buttonTextColor: Colors.white,
              ),

              const SizedBox(height: 25.0,),

              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Spacer(),
                  Text(
                    "or Login With Email",
                    style: TextStyle(
                      color:headText ,
                    ),
                  ),
                  Spacer(),
                ],
              ),

              const SizedBox(height: 25.0,),


              defaultTextField(
                controller: sighupFirstNameController ,
                fillColor: Colors.white,
                hintText: 'First Name',
                isPassword: false,
                iconButtonPadding: const EdgeInsets.symmetric(horizontal: 30.0),
                hintStyle: const TextStyle(
                  color:headText,
                  fontFamily: metropolisRegular,
                  fontSize: 14.0,
                ),
                bordColor: headText,
              ),

              const SizedBox(height: 20.0,),

              defaultTextField(
                controller: sighupLastNameController ,
                fillColor: Colors.white,
                hintText: 'Last Name',
                isPassword: false,
                iconButtonPadding: const EdgeInsets.symmetric(horizontal: 30.0),
                hintStyle: const TextStyle(
                  color:headText,
                  fontFamily: metropolisRegular,
                  fontSize: 14.0,
                ),
                bordColor: headText,
              ),

              const SizedBox(height: 20.0,),

              defaultTextField(
                controller: sighupEmailController ,
                fillColor: Colors.white,
                hintText: 'Email',
                isPassword: false,
                iconButtonPadding: const EdgeInsets.symmetric(horizontal: 30.0),
                hintStyle: const TextStyle(
                  color:headText,
                  fontFamily: metropolisRegular,
                  fontSize: 14.0,
                ),
                bordColor: headText,
              ),

              const SizedBox(height: 20.0,),

              defaultTextField(
                controller: signupPasswordController ,
                fillColor: Colors.white,
                hintText: 'Password',
                isPassword: true,
                iconButtonPadding: const EdgeInsets.symmetric(horizontal: 30.0),
                hintStyle: const TextStyle(
                  color:headText,
                  fontFamily: metropolisRegular,
                  fontSize: 14.0,
                ),
                bordColor: headText,
              ),


              const SizedBox(height: 50.0,),

              defaultMaterialButton(
                buttonColor: primaryColor,
                buttonPadding: const EdgeInsets.symmetric(horizontal: 30.0),
                buttonText: 'Sign Up',
                press: (){
                  defaultNavigator(
                      context:context,
                      page : const LoginScreen()
                  );
                },
                buttonTextColor: Colors.white,
              ),

              const SizedBox(height: 10.0,),

              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children:  [
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children:  [
                        const Text(
                          "Already have account?",
                          style: TextStyle(
                            color:headText ,
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            defaultNavigator(
                              context: context ,
                              page: const LoginScreen(),
                            );
                          },
                          child:  const Text(
                            " Login",
                            style: TextStyle(
                              color:primaryColor ,
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
    );
  }
}
