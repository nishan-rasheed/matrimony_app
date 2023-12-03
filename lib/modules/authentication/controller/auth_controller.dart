import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:matrimony/utils/constants/custom_aler.dart';
import 'package:matrimony/utils/constants/custom_print.dart';
import 'package:matrimony/utils/constants/response_helper.dart';

import '../model/user_model.dart';

class AuthController extends ChangeNotifier{

  ResponseHelper? loginresponse;

FirebaseFirestore fireStore = FirebaseFirestore.instance;
FirebaseAuth fireBaseAuth = FirebaseAuth.instance;
 int selectedIndex = 0;

  chooseGender(int v){
    selectedIndex = v;
    notifyListeners();
  }


  Future<User?> signInUser(String email,String password)async{

   try {
    loginresponse = ResponseHelper(loading: true);
    notifyListeners();
  final credential = await fireBaseAuth.signInWithEmailAndPassword(
    email: email,
    password: password
  );

  customPrint('user sign in${credential.user}');
  loginresponse = ResponseHelper(loading: false);

     notifyListeners();
  return credential.user;
} on FirebaseAuthException catch (e) {
  loginresponse = ResponseHelper(loading: false);
    notifyListeners();
  if (e.code == 'user-not-found') {
    CustomAlers.customSnackbar('No user found for that email.');
    customPrint(e.code);
  } else if (e.code == 'wrong-password') {
     CustomAlers.customSnackbar('Wrong password provided for that user.');
    customPrint('Wrong password provided for that user.');
  }

 return null; 
}
  }



 Future<User?>  signUpUser(String email,String password,String gender,String name,String phone)async{
    try {
    loginresponse = ResponseHelper(loading: true);
    notifyListeners();
     final credential = await fireBaseAuth.createUserWithEmailAndPassword(
              email: email,
              password: password,
            );

     customPrint('user registered in${credential.user}');  



     saveUserToDB(email,gender, name, phone);      
     loginresponse = ResponseHelper(loading: false);

     notifyListeners();
     
     return credential.user;
  
} on FirebaseAuthException catch (e) {
   loginresponse = ResponseHelper(loading: false);
    notifyListeners();
  if (e.code == 'weak-password') {
    customPrint('The password provided is too weak.');
  } else if (e.code == 'email-already-in-use') {
    customPrint('The account already exists for that email.');
  }

  return null;
} catch (e) {
  customPrint(e.toString());
}
    return null;
  }





 saveUserToDB(String email,String gender,String name,String phone){
   fireStore.collection('Users').doc(email).set(
    UserDataModel(
      email: email,
      phoneNumber: phone,
      fullName: name,
      gender: gender,
      ).toJson());
 }


 Future signOut()async{
  
  await fireBaseAuth.signOut();
  customPrint('user signouted');
 }

  
}