 
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';

class picimage extends ChangeNotifier{
 
  var selectedimagepath ='';
  void getimage(ImageSource imageSource)async{
    final picimage =ImagePicker();
final pickedFile=await picimage.pickImage(source: imageSource);
if(pickedFile!=null){
selectedimagepath=pickedFile.path;

}
  }
}