import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:summer_app/models/onboarding_model/onboarding_model.dart';
import 'package:summer_app/modules/login_screen/login_screen.dart';
import 'package:summer_app/modules/signup_screen/signup_screen.dart';
import 'package:summer_app/shared/app_style.dart';

class BoardingScreen extends StatefulWidget
{
  const BoardingScreen({Key? key}) : super(key: key);
  @override
  _BoardingScreenState createState() => _BoardingScreenState();
}

class _BoardingScreenState extends State<BoardingScreen>
{
  List<BoardingModel> boardingList = [
    BoardingModel(
      img: 'assets/images/onboarding1.png',
      headLine: 'Plan Your Trips',
      mainLightLine: 'Book one of our unique hotels',
      secLightLine: 'to escape the ordinary',
    ),
    BoardingModel(
      img: 'assets/images/onboarding2.png',
      headLine: 'Find Best Deals',
      mainLightLine: 'Find Deals from any season from',
      secLightLine: 'cosy country homes'
    ),
  ];
  double selectedPage=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 400.0,
            width: double.infinity,
            child: PageView.builder(
                    itemBuilder:(context , index) => SafeArea(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          image: DecorationImage(
                            image: AssetImage(boardingList[index].img),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ) ,
                  itemCount:boardingList.length ,
                  onPageChanged: (value)
                  {
                      setState(() {
                        selectedPage=value.toDouble();
                      });
                  },
                ),
          ),
          Column(
            children: [
              DotsIndicator(
                dotsCount: boardingList.length,
                position: selectedPage,
                decorator: const DotsDecorator(
                  color: Colors.grey, // Inactive color
                  activeColor: primaryColor,
                  spacing: EdgeInsets.only(right: 5.0),
                ),
              ),
              const SizedBox(height: 30.0,),
              Text(
                  boardingList[selectedPage.toInt()].headLine ,
                style: const TextStyle(
                  fontFamily: 'Metropolis_Black',
                  color: tittleTextColor,
                  fontSize: 28.0,
                ),
              ),
              const SizedBox(height: 25.0,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    boardingList[selectedPage.toInt()].mainLightLine ,
                    style: const TextStyle(
                      fontFamily: 'Metropolis_Regular',
                      color: lightTittleTextColor,
                      fontSize: 13.0,
                    ),
                  ),
                  const SizedBox(height: 5.0,),
                  Row(
                    children: [
                      const Spacer(),
                      Text(
                        boardingList[selectedPage.toInt()].secLightLine ,
                        style: const TextStyle(
                          fontFamily: 'Metropolis_Regular',
                          color: lightTittleTextColor,
                          fontSize: 13.0,
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 40.0,),
              defaultMaterialButton(
                buttonColor: primaryColor,
                buttonPadding: const EdgeInsets.symmetric(horizontal: 30.0),
                buttonText: 'Login',
                press: (){
                  defaultNavigator(
                      context:context,
                     page : const LoginScreen()
                  );
                },
                buttonTextColor: Colors.white,
              ),
              const SizedBox(height: 20.0,),
              defaultMaterialButton(
                buttonColor: Colors.white,
                buttonPadding: const EdgeInsets.symmetric(horizontal: 30.0),
                buttonText: 'Create an Account',
                press: (){
                  defaultNavigator(
                      context:context,
                      page : const SignupScreen()
                  );
                },
                buttonTextColor: lightText ,
              ),
            ],
          ),
        ],
      ),
    );
  }

}
