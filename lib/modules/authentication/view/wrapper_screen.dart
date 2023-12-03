import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:matrimony/modules/authentication/view/authentication_page.dart';
import 'package:matrimony/utils/constants/custom_print.dart';

import '../../home/view/home_screen.dart';

class WrapperScreen extends StatelessWidget {
   WrapperScreen({Key? key}) : super(key: key);

  FirebaseAuth fA = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: fA.authStateChanges(), 
      builder: (context, snapshot) {
        customPrint(snapshot.data?.email.toString()??'');
        if (snapshot.hasData) {
          customPrint(snapshot.data?.email??'');
           return const HomeScreen();
        }
        else{
          return const AuthenticationScreen();
        }
      },);
  }
}