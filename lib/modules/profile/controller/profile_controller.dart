import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:matrimony/utils/constants/custom_print.dart';

import '../../authentication/model/user_model.dart';

class ProfileController extends ChangeNotifier{

  FirebaseFirestore fireStore = FirebaseFirestore.instance;
FirebaseAuth fireBaseAuth = FirebaseAuth.instance;
FirebaseStorage storage = FirebaseStorage.instance;

File? pickedImage;

  pickImage()async{
    ImagePicker imagePicker = ImagePicker();
   try {
      final dddd =await imagePicker.pickImage(source: ImageSource.gallery);

      pickedImage = File(dddd?.path??'');
      notifyListeners();
   } catch (e) {
       customPrint(e.toString());
   }
  } 


  String? imageUrl;
  bool isloading = false;

  Future addImagetoFirebase(File? imageFile)async{

    try {

      

       isloading = true;
      notifyListeners();
    

    Reference ref = storage.ref().child('images');

    UploadTask uploadTask = ref.putFile(imageFile??File(''));
    
    TaskSnapshot snapShot = await uploadTask;
    
    imageUrl = await snapShot.ref.getDownloadURL();
    customPrint(imageUrl??'');
    notifyListeners();

      
    } catch (e) {
       customPrint(e.toString());
    }

    
  }
  

  updateProfile(UserDataModel userInfo){
   
    fireStore.collection('Users').doc(fireBaseAuth.currentUser?.email).update(userInfo.toJson());
  customPrint('profile updated');
  isloading = false;
    notifyListeners();
    
  }
 

}