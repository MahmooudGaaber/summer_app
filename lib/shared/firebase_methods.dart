import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:summer_app/models/user/userdata_model.dart';

import 'app_style.dart';

class FireBaseMethods{
  FireBaseMethods();
  late File file = File("");
  Future<UserSignUpMode> signup(String name, String pass, String email) async {
   UserCredential newUser = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email,
      password: pass,
    );
    DatabaseReference databaseReference = FirebaseDatabase.instance.ref().child("Users")
        .child(FirebaseAuth.instance.currentUser!.uid);
   databaseReference
        .set({
      "First Name": name,
   //   "Last Name": sighupLastNameController.text,
      "Email": email,
    });
   var snapShotData = databaseReference.once();
  var map = await snapShotData.then((value) => (value.snapshot.value  as Map<dynamic,dynamic> ));
   UserSignUpMode user = UserSignUpMode.fromJson(map);
return user;
  }


  Future login (String email , String password) async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }


 void gettingError({ page, context }){
    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        title: Text('Something Get Wrong'),
        content: Image(
          image: AssetImage("assets/images/404-errorgif.gif"),
        ),
      ),
    );
    Future.delayed(const Duration(seconds: 2), () async {
      return Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute<void>(
              builder: (BuildContext context) =>
               page),
              (route) => false);
    });
  }

  void signupDone({ page , context}){
    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        title: Text(
          "Let's Start our Journey",
          style: TextStyle(
            color: primaryColor,
            fontSize: 20.0,
            fontFamily: metropolisBold,
          ),
        ),
        content: Image(
          image:
          AssetImage("assets/images/signup_done.gif"),
        ),
      ),
    );
    Future.delayed(const Duration(seconds: 2), () async {
      return Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute<void>(
              builder: (BuildContext context) =>
               page()),
              (route) => false);
    });

  }

  void loginDone({ page , context}){
    showDialog(
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
    Future.delayed(const Duration(seconds: 2), () async {
      return Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute<void>(
              builder: (BuildContext context) =>
               page),
              (route) => false);
    });
  }

  Future uploadProfilePic() async {
    await FirebaseStorage.instance
        .ref()
        .child("ProfilePicturesFolder")
        .child("profilePic").putFile(file).then((p0) => null);
  }

  Future<File?> selectFile() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);
    if (result == null) return null ;
    final path = result.files.single.path!;
    final fileName = result.files.single.name;
    file = File(path);
  }

  // Future<String?> putProfilePic (){
  //   imageLink =  FirebaseStorage.instance
  //       .ref()
  //       .child("ProfilePicturesFolder")
  //       .child("profilePic").getDownloadURL();
  //   return imageLink ;
  // }



}