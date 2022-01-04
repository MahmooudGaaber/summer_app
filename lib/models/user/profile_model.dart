import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileMode{
  late String profileSettingText ;
  late IconData profileSettingIcon ;
  Divider profileSettingDivider ;
  Function() profileFunction;

  ProfileMode({
    required this.profileSettingIcon,
    required this.profileSettingText,
    required this.profileSettingDivider,
    required this.profileFunction,
});
}

List<ProfileMode> profileModel = [
  ProfileMode(
    profileSettingDivider:const Divider(height: 2.0,color: Colors.grey,),
    profileSettingIcon:  Icons.lock,
    profileSettingText: "Change Password",
    profileFunction: (){},
  ),
  ProfileMode(
    profileSettingDivider: const Divider(height: 2.0,color: Colors.grey,),
    profileSettingIcon:   Icons.people,
    profileSettingText: "Invite Friends",
    profileFunction: (){},
  ),
  ProfileMode(
    profileSettingDivider:const Divider(height: 2.0,color: Colors.grey,) ,
    profileSettingIcon: Icons.wallet_giftcard,
    profileSettingText: 'Credits & Coupons',
    profileFunction: (){},
  ),
  ProfileMode(
    profileSettingDivider:const Divider(height: 2.0,color: Colors.grey,) ,
    profileSettingIcon: Icons.help_center_outlined,
    profileSettingText: 'Payment',
    profileFunction: (){},
  ),
  ProfileMode(
    profileSettingDivider: const Divider(height: 2.0,color: Colors.grey,),
    profileSettingIcon: Icons.payment_outlined,
    profileSettingText: 'Setting',
    profileFunction: (){},
  ),
  ProfileMode(
    profileSettingDivider:const Divider(height: 2.0,color: Colors.grey,) ,
    profileSettingIcon: Icons.settings,
    profileSettingText: 'Log Out',
    profileFunction: () async {
      await FirebaseAuth.instance.currentUser!.delete();
    },
  ),
] ;