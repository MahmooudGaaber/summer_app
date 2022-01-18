import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:summer_app/shared/app_style.dart';
import 'package:summer_app/test_model.dart';

import 'modules/user/mytrips_screen.dart';

class FireStoreTest1 extends StatefulWidget
{
  const FireStoreTest1({Key? key}) : super(key: key);
  @override
  _FireStoreTest1State createState() => _FireStoreTest1State();
}

class _FireStoreTest1State extends State<FireStoreTest1>
{
  var formKey = GlobalKey<FormState>();
  TextEditingController hotelNameController = TextEditingController();
  TextEditingController hotelPriceController = TextEditingController();
  TextEditingController hotelLocationController = TextEditingController();
  TextEditingController peopleNumberController = TextEditingController();
  TextEditingController roomsNumberController = TextEditingController();
  var storageRef = FirebaseStorage.instance.ref("testcard");
  CollectionReference testCard =  FirebaseFirestore.instance.collection('test');
  late File imagePicked;
  late dynamic imageUploaded;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                const SizedBox(
                  height: 35.0,
                ),
                defaultMaterialButton(
                  buttonColor: Colors.black,
                  buttonTextColor: Colors.white,
                  buttonPadding: const EdgeInsets.symmetric(horizontal: 20.0),
                  buttonText: "Image Picker",
                  buttonTextStyle: const TextStyle(
                    fontFamily: metropolisExtraBold,
                  ),
                  press: () {
                    pickImage();
                  },
                ),
                const SizedBox(
                  height: 35.0,
                ),
                defaultTextField(
                  controller: hotelNameController,
                  bordColor: Colors.black,
                  hintStyle: const TextStyle(
                    color: Colors.black,
                    fontFamily: metropolisBold,
                  ),
                  iconButtonPadding:
                      const EdgeInsets.symmetric(horizontal: 20.0),
                  hintText: "Hotel Name",
                  fillColor: Colors.white,
                  isPassword: false,
                  keyboardType: TextInputType.name,
                  textFieldValidator: (value) {
                    if (value.isEmpty) {
                      return "Must Not Be Empty";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 35.0,
                ),
                defaultTextField(
                  controller: hotelPriceController,
                  bordColor: Colors.black,
                  hintStyle: const TextStyle(
                    color: Colors.black,
                    fontFamily: metropolisBold,
                  ),
                  iconButtonPadding:
                      const EdgeInsets.symmetric(horizontal: 20.0),
                  hintText: "Hotel Price",
                  fillColor: Colors.white,
                  isPassword: false,
                  keyboardType: TextInputType.number,
                  textFieldValidator: (value) {
                    if (value.isEmpty) {
                      return "Must Not Be Empty";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 35.0,
                ),
                defaultTextField(
                  controller: hotelLocationController,
                  bordColor: Colors.black,
                  hintStyle: const TextStyle(
                    color: Colors.black,
                    fontFamily: metropolisBold,
                  ),
                  iconButtonPadding:
                      const EdgeInsets.symmetric(horizontal: 20.0),
                  hintText: "Hotel Location",
                  fillColor: Colors.white,
                  isPassword: false,
                  keyboardType: TextInputType.text,
                  textFieldValidator: (value) {
                    if (value.isEmpty) {
                      return "Must Not Be Empty";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 35.0,
                ),
                defaultTextField(
                  controller: peopleNumberController,
                  bordColor: Colors.black,
                  hintStyle: const TextStyle(
                    color: Colors.black,
                    fontFamily: metropolisBold,
                  ),
                  iconButtonPadding:
                      const EdgeInsets.symmetric(horizontal: 20.0),
                  hintText: "People Number",
                  fillColor: Colors.white,
                  isPassword: false,
                  keyboardType: TextInputType.number,
                  textFieldValidator: (value) {
                    if (value.isEmpty) {
                      return "Must Not Be Empty";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 35.0,
                ),
                defaultMaterialButton(
                  buttonColor: Colors.black,
                  buttonTextColor: Colors.white,
                  buttonPadding: const EdgeInsets.symmetric(horizontal: 20.0),
                  buttonText: "Add Card",
                  buttonTextStyle: const TextStyle(
                    fontFamily: metropolisExtraBold,
                  ),
                  press: () {


                     upLoadData(image: imagePicked,).then((value) {
                       getTrips().then((value) {
                         Navigator.of(context).pushAndRemoveUntil(

                             MaterialPageRoute<void>(
                                 builder: (BuildContext context) =>
                                 const TripsScreen()),
                                 (route) => false);
                       });
                     });


                  },
                ),
                const SizedBox(
                  height: 35.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return null;
    imagePicked = File(image.path);
  }


  Future upLoadData({File? image}) async {
    var uploadTask = storageRef.child(image.toString()).putFile(imagePicked);
    var storageSnapsShot = uploadTask.whenComplete(() => print("Uploaded"));
    imageUploaded = await storageSnapsShot.then((value) => value.ref.getDownloadURL());
    TestModel test = TestModel(
      location: hotelLocationController.text,
      name: hotelNameController.text,
      price: hotelPriceController.text,
      date: DateTime.now().toString(),
      image: imageUploaded,
      people: peopleNumberController.text,
      rooms: roomsNumberController.text,
    );
    await testCard.add(test.toJson()) ;
    // var added = await testCard.get();
    // print("/////////////////${added}//////////////");
    // print("******************${added.docs}//////////////");
    // TestModel cardTest = TestModel.fromJson(added as  Map<dynamic, dynamic> );
    // cardTestModel.add(cardTest);
    // added.then((value) {
    //  testCard.doc(value.id).get().then((value){
    //    TestModel test = TestModel.fromJson(value.data() as  Map<String, dynamic> );
    //    print("/////////////////${test.name}//////////////");
    //  });
    // });
   // return cardTest ;
  }

 Future<List<TestModel>> getTrips () async
  {
   await FirebaseFirestore.instance.collection('test').get().then((value) {
      for (var element in value.docs) {
        cardTestModel.add(TestModel.fromJson(element.data() )
        );
      } });
   return cardTestModel ;
  }


}

