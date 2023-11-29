import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:matrimony/utils/constants/custom_print.dart';

class ProfileController extends ChangeNotifier{

XFile? pickedImage;

  pickImage()async{
    ImagePicker imagePicker = ImagePicker();
   try {
      final dddd =await imagePicker.pickImage(source: ImageSource.gallery);

      pickedImage = dddd;
      notifyListeners();
   } catch (e) {
       customPrint(e.toString());
   }
  } 
 

}