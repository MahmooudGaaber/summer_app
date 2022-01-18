
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:summer_app/shared/app_style.dart';

class TestScreen extends StatefulWidget
{
  const TestScreen({Key? key}) : super(key: key);
  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen>
{
   late File file = File("");
   late String imageDownloadLink ;

   @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          defaultMaterialButton(
            buttonColor: primaryColor,
            buttonTextColor: Colors.white,
            buttonPadding: const EdgeInsets.symmetric(horizontal: 20.0),
            buttonText: "Image Picker",
            buttonTextStyle: const TextStyle(
              fontFamily: metropolisExtraBold,
            ),
           press: (){},
          ),
          Text(
            file.path ,
            style: const TextStyle(
              fontSize: 16.0,
              fontFamily: metropolisExtraBold,
            ),
          ),


          const Spacer(),


          defaultMaterialButton(
            buttonColor: primaryColor,
            buttonTextColor: Colors.white,
            buttonPadding: const EdgeInsets.symmetric(horizontal: 20.0),
            buttonText: "Upload Image",
            buttonTextStyle: const TextStyle(
              fontFamily: metropolisExtraBold,
            ),
            press:( ) async {
              // how to upload a file to firebase storage
              uploadFile(
                file: file ,
                filename: "test",
                refName: "Images", imageURL: null,
              );

            },
          ),

          const Spacer(),



          defaultMaterialButton(
            buttonColor: primaryColor,
            buttonTextColor: Colors.white,
            buttonPadding: const EdgeInsets.symmetric(horizontal: 20.0),
            buttonText: "Download Image",
            buttonTextStyle: const TextStyle(
              fontFamily: metropolisExtraBold,
            ),
            press: (){

            },
          ),
          Text(
            file.path,
            style: const TextStyle(
              fontSize: 16.0,
              fontFamily: metropolisExtraBold,
            ),
          ),

        ],
      ),
    );
  }


  // how to pick a photo from gallery


   // how to upload a file to firebase storage
  Future uploadFile({ required refName, required filename, required file , required imageURL}) async {
    await FirebaseStorage.instance
        .ref()
        .child(refName)
        .child(filename).putFile(file).then((p0) => null);

   imageURL = FirebaseStorage.instance
        .ref()
        .child(refName)
        .child(filename).getDownloadURL();

  }



}
