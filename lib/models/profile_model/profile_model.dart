import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileMode{
  late String profileSettingText ;
  late IconData profileSettingIcon ;
  Divider profileSettingDivider ;

  ProfileMode({
    required this.profileSettingIcon,
    required this.profileSettingText,
    required this.profileSettingDivider,
});
}

List<ProfileMode> profileModel = [
  ProfileMode(
    profileSettingDivider:const Divider(height: 2.0,color: Colors.grey,),
    profileSettingIcon:  Icons.lock,
    profileSettingText: "Change Password",
  ),
  ProfileMode(
    profileSettingDivider: const Divider(height: 2.0,color: Colors.grey,),
    profileSettingIcon:   Icons.people,
    profileSettingText: "Invite Friends",
  ),
  ProfileMode(
    profileSettingDivider:const Divider(height: 2.0,color: Colors.grey,) ,
    profileSettingIcon: Icons.wallet_giftcard,
    profileSettingText: 'Credits & Coupons',
  ),
  ProfileMode(
    profileSettingDivider:const Divider(height: 2.0,color: Colors.grey,) ,
    profileSettingIcon: Icons.help_center_outlined,
    profileSettingText: 'Help Center',
  ),
  ProfileMode(
    profileSettingDivider: const Divider(height: 2.0,color: Colors.grey,),
    profileSettingIcon: Icons.payment_outlined,
    profileSettingText: 'Payment',
  ),
  ProfileMode(
    profileSettingDivider:const Divider(height: 2.0,color: Colors.grey,) ,
    profileSettingIcon: Icons.settings,
    profileSettingText: 'Settings',
  ),
] ;