import 'package:flutter/foundation.dart';

customPrint(String text){
  if (kDebugMode) {
    print('*******$text***********');
  }
}