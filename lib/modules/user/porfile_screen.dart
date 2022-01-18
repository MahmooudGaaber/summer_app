import 'dart:io';
import 'dart:ui';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:summer_app/models/user/profile_model.dart';
import 'package:summer_app/shared/app_style.dart';
import 'package:summer_app/shared/firebase_methods.dart';

class ProfileScreen extends StatefulWidget
{
  const ProfileScreen({Key? key}) : super(key: key);
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
{
  String imageLink ="" ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            const SizedBox(
              height:30.0 ,
            ),
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
                      height: 100.0,
                      width: 100.0,
                      decoration:  BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image:  NetworkImage( imageLink),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                              bottom: 0.0,
                              right: 0.0,
                              child: SizedBox(
                                height: 35.0,
                                width: 35.0,
                                child: RawMaterialButton(
                                  onPressed: ()  {},
                                  elevation: 2.0,
                                  fillColor: Colors.white,
                                  child: const Icon(Icons.camera_alt_outlined, color: primaryColor,),
                                  shape: const CircleBorder(),
                                ),
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
                const Spacer(),
              ],
            ),
            const SizedBox(
              height:50.0 ,
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder:(context ,index)=>defaultSettingItemBuild(index) ,
                itemCount:profileModel.length ,
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget defaultSettingItemBuild(index){
    return Padding(
      padding:  const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: (){
              profileModel[index].profileFunction;
              exit(0);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                    profileModel[index].profileSettingText,
                  style: const TextStyle(
                    color: tittleTextColor ,
                    fontFamily: metropolisMedium ,
                    fontSize: 15.0,
                  ),
                ),
                Icon(
                  profileModel[index].profileSettingIcon,
                  color: lightTittleTextColor,
                  size: 20.0,
                )
              ],
            ),
          ),
          const SizedBox(height: 20.0,),
          profileModel[index].profileSettingDivider,
          const SizedBox(height: 20.0,),
        ],
      ),
    );
  }
}
