import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart'as path;
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class imagePicker_Provider with ChangeNotifier {
  File _image;
  PickedFile pickedImage;
  String imgUrl;
  final picker = ImagePicker();

  File get GetImage=>_image;

  Future getImage() async {
     pickedImage = await picker.getImage(source: ImageSource.camera);
      _image = File(pickedImage.path);
      notifyListeners();
  }
  Future getImageFromGallery() async {
     pickedImage = await picker.getImage(source: ImageSource.gallery);
    _image=File(pickedImage.path);
    notifyListeners();
  }

  Future<String> getImageUrl()async
  {
    var storagVar=FirebaseStorage.instance.ref().child('images/${path.basename(_image.path)}');
    UploadTask uploadTask=storagVar.putFile(GetImage);
     uploadTask.whenComplete(() async{
      imgUrl=await storagVar.getDownloadURL();
      print(imgUrl);
    });
    notifyListeners();
  }
}