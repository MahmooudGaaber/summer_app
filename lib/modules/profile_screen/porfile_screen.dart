import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:summer_app/shared/app_style.dart';

class ProfileScreen extends StatefulWidget
{
  const ProfileScreen({Key? key}) : super(key: key);
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            Row(
              children:   [
                const Spacer(),
                Column(
                  children:  [
                    const Text(
                      "Login" ,
                      style: TextStyle(
                        fontFamily: 'Metropolis_Black',
                        color: tittleTextColor,
                        fontSize: 28.0,
                      ),
                    ),
                    const SizedBox(height: 15.0,),
                    const Text(
                      "View and Edit Profile" ,
                      style: TextStyle(
                        fontFamily: metropolisMedium,
                        color: tittleTextColor,
                        fontSize: 15.0,
                      ),
                    ),
                    const SizedBox(height: 15.0,),
                    Container(
                      decoration: BoxDecoration(
                        
                      ),
                    ),
                  ],
                ),
                const Spacer(),
              ],
            ),


          ],
        ),
      ),
    );
  }
}
