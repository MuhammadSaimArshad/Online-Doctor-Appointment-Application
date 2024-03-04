import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class DoctorSchedule extends GetxController {
  static DoctorSchedule get to => Get.find();
  XFile? hpickedFile;
  String? link;
  pickImage(ImageSource source, context) async {
    var pickedImage = await ImagePicker().pickImage(source: source);
    update();
    if (pickedImage != null) {
      hpickedFile = pickedImage;
      Navigator.pop(context);
      update();
    }
    print("xfileimage$hpickedFile");
    return hpickedFile;
  }

  Future<String> uploadImage(String id) async {
    try {
      Reference ref = FirebaseStorage.instance
          .ref()
          .child("/doctor")
          .child("/recepit")
          .child(id);

      UploadTask uploadTask;
      if (kIsWeb) {
        uploadTask = ref.putData(
            await hpickedFile!.readAsBytes(),
            SettableMetadata(
              contentType: 'image/jpeg',
            ));
      } else {
        uploadTask = ref.putData(
          await hpickedFile!.readAsBytes(),
          SettableMetadata(contentType: 'image/jpeg'),
        );
      }

      TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() {});

      if (taskSnapshot.state == TaskState.success) {
        var url = await ref.getDownloadURL();
        print("3333333333333/link");
        link = url;
      } else {
        Fluttertoast.showToast(
          msg: "Image upload failed!",
          backgroundColor: Colors.red,
          textColor: Colors.white,
          gravity: ToastGravity.BOTTOM,
          fontSize: 17,
          timeInSecForIosWeb: 1,
          toastLength: Toast.LENGTH_LONG,
        );
      }
    } catch (e) {
      print("error/${e.toString()}");
      Fluttertoast.showToast(
        msg: "Image upload error: /e",
        backgroundColor: Colors.red,
        textColor: Colors.white,
        gravity: ToastGravity.BOTTOM,
        fontSize: 17,
        timeInSecForIosWeb: 1,
        toastLength: Toast.LENGTH_LONG,
      );
    }
    return link!;
  }
}
