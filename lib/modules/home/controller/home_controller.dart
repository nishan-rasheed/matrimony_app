import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:matrimony/utils/constants/custom_print.dart';
import 'package:collection/collection.dart';

import '../../authentication/model/user_model.dart';

class HomeController extends ChangeNotifier{

  FirebaseFirestore db = FirebaseFirestore.instance;
  FirebaseAuth fireBaseAuth = FirebaseAuth.instance;

  List<UserDataModel> profileList = [];

  Stream? profileStream;

  UserDataModel? currentUserDetails ;

  getAllProfiles()async{

    CollectionReference productsRef = db.collection('Users');
    var snapshot = await productsRef.get();
   
    profileStream = productsRef.snapshots();

  List<UserDataModel> data =  snapshot.docs.map((doc) => 
  UserDataModel.fromMap(doc.data() as Map<String,dynamic>)).toList();

    currentUserDetails = data.firstWhereOrNull((e) => e.email==fireBaseAuth.currentUser?.email);

    profileList = data.where((e) => e.email != fireBaseAuth.currentUser?.email).toList();

    

      customPrint(json.encode(data));
      customPrint(data.length.toString());
      notifyListeners();

  }


  List<UserDataModel>? filteredlist;
  bool isLoading = false;

  filterData(String gender,String location,RangeValues age,RangeValues height,RangeValues weight){
    isLoading = false;
    notifyListeners();
    List<UserDataModel> initialList = profileList.where((e)=>
       e.gender == gender&&
       (e.country??'').contains(location)||
       (e.city??'').contains(location)||
       (e.state??''). contains(location)&&
        num.parse(e.age??'')>=age.start&&num.parse(e.age??'')<=age.end&&
        num.parse(e.height??'')>=height.start&&num.parse(e.height??'')<=height.end&&
        num.parse(e.weight??'')>=weight.start&&num.parse(e.weight??'')<=weight.end
     ).toList();

     filteredlist = initialList;

     customPrint('length is ${filteredlist?.length}');

     customPrint(json.encode(filteredlist));
     isLoading =false;
     notifyListeners();
  }


  resetFilter(){
    filteredlist=null;
    customPrint('${filteredlist?.length}');
    notifyListeners();
  }

}