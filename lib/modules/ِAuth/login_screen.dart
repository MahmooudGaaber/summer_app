import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:summer_app/shared/app_style.dart';

import '../bottom_navi.dart';

class LoginScreen extends StatefulWidget
{
  const LoginScreen({Key? key}) : super(key: key);
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
{
  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
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
                press: (){
                  Navigator.pop(context);
                },
                buttonColor: Colors.white,
                buttonIcon:  Icons.keyboard_arrow_left,
                buttonIconColor: lightText ,
                buttonIconSize: 30.0,
              ),
              Row(
                children:  const [
                  Spacer(),
                  Text(
                    "Login" ,
                    style: TextStyle(
                      fontFamily: 'Metropolis_Black',
                      color: tittleTextColor,
                      fontSize: 28.0,
                    ),
                  ),
                  Spacer(),
                ],
              ),

              const SizedBox(height: 100.0,),

              defaultTextField(
                controller: loginEmailController ,
                fillColor: Colors.white,
                keyboardType: TextInputType.emailAddress,
                hintText: 'Your Email',
                textFieldValidator:   (value) {
                    if (value.isEmpty || !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                    return "Enter Right Email Form";
                    }
                    return null;
                    },
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
                controller: loginPasswordController ,
                fillColor: Colors.white,
                keyboardType: null,
                hintText: 'Password',
                textFieldValidator: (value) {
                  if (value.isEmpty) {
                    return "Password is Empty";
                  }
                  return null;
                },
                isPassword: true,
                iconButtonPadding: const EdgeInsets.symmetric(horizontal: 30.0),
                hintStyle: const TextStyle(
                  color:headText,
                  fontFamily: metropolisRegular,
                  fontSize: 14.0,
                ),
                bordColor: headText,
              ),

              const SizedBox(height: 90.0,),

              defaultMaterialButton(
                buttonColor: primaryColor,
                buttonPadding: const EdgeInsets.symmetric(horizontal: 30.0),
                buttonText: 'Login',
                buttonTextColor: Colors.white,
                press: () async {

                  if(formKey.currentState!.validate())
                  {
                    try {
                        await FirebaseAuth.instance.signInWithEmailAndPassword(
                          email: loginEmailController.text,
                          password: loginPasswordController.text,
                      );

                        await   Navigator.of(context)
                            .pushAndRemoveUntil(
                            MaterialPageRoute<void>(
                                builder: (BuildContext context) => const BottomNavi()),
                                (route) => false
                        );

                        await   showDialog(
                          context: context,
                          builder: (context) => const AlertDialog(
                            title: Text(
                                'Welcome again',
                              style: TextStyle(
                                color: primaryColor,
                                fontSize: 20.0,
                                fontFamily: metropolisBold,
                              ),
                            ),
                            content: Image(
                              image: AssetImage("assets/images/login_done.gif"),
                            ),
                          ),
                        );



                    } on FirebaseAuthException catch (e) {


                      showDialog(
                          context: context,
                          builder: (context) => const AlertDialog(
                              title: Text('Something Get Wrong'),
                              content: Image(
                                image: AssetImage("assets/images/404-errorgif.gif"),
                              ),
                          ),
                      );




                    }

                  }


                  },
              ),

              const SizedBox(height: 10.0,),

              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                 const Spacer(),
                 InkWell(
                   onTap: (){},
                   child: const Padding(
                     padding: EdgeInsets.all(10.0),
                     child: Text(
                       "Forget Your Password?",
                       style: TextStyle(
                         color:headText ,
                       ),
                     ),
                   ),
                 ),
                 const Spacer(),
                ],
              ),

              const SizedBox(height: 50.0,),

              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Spacer(),
                  Text(
                    "or Login With",
                    style: TextStyle(
                      color:headText ,
                    ),
                  ),
                  Spacer(),
                ],
              ),

              const SizedBox(height: 25.0,),

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

            ],
          ),
        ),
      ),
    ),
    );
  }
}
