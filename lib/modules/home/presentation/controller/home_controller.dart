import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:matrimony/modules/authentication/presentation/model/user_model.dart';
import 'package:matrimony/utils/constants/custom_print.dart';

class HomeController extends ChangeNotifier{

  FirebaseFirestore db = FirebaseFirestore.instance;
  FirebaseAuth fireBaseAuth = FirebaseAuth.instance;

  List profileList = [];

  getAllProfiles()async{

    CollectionReference productsRef = db.collection('Users');
    var snapshot = await productsRef.get();

    
   
    //  profileList = snapshot.docs.where((e) => e['email'] != fireBaseAuth.currentUser?.email).toList();
  List<UserDataModel> data =  snapshot.docs.map((doc) => UserDataModel.fromMap(doc.data() as Map<String,dynamic>)).toList();
    profileList =data.where((e) => e.email != fireBaseAuth.currentUser?.email).toList();
      // profileList = snapshot.docs
      //   .map((docSnapshot) => UserDataModel.fromDocumentSnapshot(docSnapshot))
      //   .toList();
      customPrint(json.encode(data));
      customPrint(data.length.toString());
      notifyListeners();

  }

}