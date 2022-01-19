import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:summer_app/models/user/userdata_model.dart';
import 'package:summer_app/shared/app_style.dart';

class AuthRepo {
  CollectionReference users =  FirebaseFirestore.instance.collection('Users');


  Future<UserModel> signup({
    required String pass,
    required UserModel user
  }) async
  {
    UserCredential newUser = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: user.email.toString(),
      password: pass,
    );
    UserModel model = UserModel(
        firstName: user.firstName.toString(),
        email: user.email.toString(),
        lastname: user.lastname.toString(),
      id: '',
    );
    model.id = newUser.user!.uid ;
    users.doc(model.id).set(model.toJson());
    return model ;
  }


  Future login ({
    required String pass,
    required UserModel user
  })async
  {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: user.email,
      password: pass,
    ).then((value) {
      users.doc(value.user!.uid).get().then((v) {
        userList.add(UserModel.fromJson(v.data() as Map<String,dynamic>));
      });
    });

    print("/////////////////////*${userList.length}*///////////////");
  }



}