import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:matrimony/modules/authentication/presentation/model/user_model.dart';
import 'package:matrimony/utils/constants/custom_print.dart';

class AuthController extends ChangeNotifier{

FirebaseFirestore fireStore = FirebaseFirestore.instance;
FirebaseAuth fireBaseAuth = FirebaseAuth.instance;
 int selectedIndex = 0;

  chooseGender(int v){
    selectedIndex = v;
    notifyListeners();
  }


  Future<User?> signInUser(String email,String password)async{
   try {
  final credential = await fireBaseAuth.signInWithEmailAndPassword(
    email: email,
    password: password
  );

  customPrint('user sign in${credential.user}');
  return credential.user;
} on FirebaseAuthException catch (e) {
  if (e.code == 'user-not-found') {
    print('No user found for that email.');
  } else if (e.code == 'wrong-password') {
    print('Wrong password provided for that user.');
  }

 return null; 
}
  }



 Future<User?>  signUpUser(String email,String password,String gender,String name,String phone)async{
    try {
     final credential = await fireBaseAuth.createUserWithEmailAndPassword(
              email: email,
              password: password,
            );

     customPrint('user registered in${credential.user}');       

     saveUserToDB(email, password, gender, name, phone);      
     
     return credential.user;
  
} on FirebaseAuthException catch (e) {
  if (e.code == 'weak-password') {
    customPrint('The password provided is too weak.');
  } else if (e.code == 'email-already-in-use') {
    customPrint('The account already exists for that email.');
  }

  return null;
} catch (e) {
  customPrint(e.toString());
}
  }





 saveUserToDB(String email,String password,String gender,String name,String phone){
   fireStore.collection('Users').doc(email).set(
    UserDataModel(
      email: email,
      phoneNumber: phone,
      fullName: name,
      gender: gender,
      password: password
      ).toJson());
 }


 Future signOut()async{
  
  await fireBaseAuth.signOut();
  customPrint('user signouted');
 }

  
}