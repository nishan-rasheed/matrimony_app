import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:matrimony/modules/authentication/presentation/pages/authentication_page.dart';
import 'package:matrimony/modules/home/presentation/pages/home_screen.dart';
import 'package:matrimony/utils/constants/custom_print.dart';

class WrapperScreen extends StatelessWidget {
   WrapperScreen({Key? key}) : super(key: key);

  FirebaseAuth fA = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: fA.authStateChanges(), 
      builder: (context, snapshot) {
        customPrint(snapshot.data?.email.toString()??'dhgvdmjhvdmjhd');
        if (snapshot.hasData) {
          customPrint(snapshot.data?.email??'');
           return HomeScreen();
        }
        else{
          return AuthenticationScreen();
        }
      },);
  }
}