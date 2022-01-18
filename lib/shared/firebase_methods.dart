import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:summer_app/models/hotel_model/hotel_model.dart';
import 'package:summer_app/models/hotel_model/hotel_rooms_model.dart';
import 'package:summer_app/models/search_model/search_model.dart';
import 'package:summer_app/models/user/userdata_model.dart';
import 'package:summer_app/shared/app_style.dart';
import 'app_style.dart';

class FireBaseMethods{
  FireBaseMethods();
  late File file = File("");
  String imageLink = "https://image.shutterstock.com/image-vector/man-character-face-avatar-glasses-260nw-562077406.jpg"  ;


  Future<UserSignUpMode> signup(String name, String pass, String email) async
  {
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
      "Email": email,
    });
   var snapShotData = databaseReference.once();
  var map = await snapShotData.then((value) => (value.snapshot.value  as Map<dynamic,dynamic> ));
   UserSignUpMode user = UserSignUpMode.fromJson(map);
return user;
  }

  Future login (String email , String password) async
  {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

   void gettingError({ page, context })
   {
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

   void signupDone({ page , context})
   {
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
               page),
              (route) => false);
    });

  }

   void loginDone({ page , context})
   {
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

  //  Future<dynamic> uploadProfilePic() async
  //  {
  //   final result = await FilePicker.platform.pickFiles(allowMultiple: false );
  //   if (result == null) return null ;
  //   final path = result.files.single.path;
  //   final filename = result.files.single.name;
  //   file = File(path!);
  //   var storageRef = FirebaseStorage.instance
  //       .ref()
  //       .child("ProfilePicturesFolder")
  //       .child(filename);
  //   var uploadTask = storageRef.putFile(file) ;
  //   var storageSnapShot = uploadTask.whenComplete(() => print("Complete"));
  //   imageLink = await storageSnapShot.then((value) => value.ref.getDownloadURL()) ;
  //   return imageLink ;
  // }

   getHotelData () async
   {
   await FirebaseFirestore.instance.collection("Hotels").get().then((value) {
     for (var element in value.docs) {
       List<HotelRoomsModel> roomsModel = [];
       hotelModel.add(HotelModel.fromJson(element.data()));
       element.reference.collection("rooms").get().then((value) {
         for (var element in value.docs) {
           roomsModel.add(HotelRoomsModel.fromJson(element.data()));
         }
       }
       );
       hotelRoomsModel.add(roomsModel);
     } });
   }

   getSearchData () async
   {
      await FirebaseFirestore.instance.collection("searchHistory").where("userId",isEqualTo:"hNWbcHwGFAdOCKhDDIB0NVHqYRz2" ).get().then((value) {
        for (var element in value.docs) {
          userSearchHistory.add(SearchModel.fromJson(element.data()));
        }
        for (var e in userSearchHistory) {
          userSearchedHotels.add(hotelModel.firstWhere((element) => element.id == e.hotelId));
        }

      });
   }

  }


