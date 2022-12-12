import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jobportal/UI/Screens/Home/home_for_applicant.dart';
import 'package:jobportal/UI/Screens/dialogs/auth_dialog.dart';
import 'package:jobportal/UI/base_viewmodel.dart';
import 'package:jobportal/core/model/user.dart';
import 'package:jobportal/core/services/auth_service.dart';
import 'package:jobportal/core/services/custom_auth.dart';
import 'package:jobportal/core/services/database_service.dart';
import 'package:jobportal/core/services/locator.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:jobportal/core/services/storage_service.dart';

class SignUpViewModel extends BaseViewModel {
  UserProfile user = UserProfile();
  FirebaseStorageService firebaseStorage = FirebaseStorageService();
  bool busyState = false;

  final authService = locator<AuthService>();
  final dbService = locator<DatabaseService>();
  late CustomAuthResult authResult;
  bool isLoading = false;

  File? profileImage;
  final picker = ImagePicker();
  imgFromCamera() async {
    final pickedFile =
        await picker.pickImage(source: ImageSource.camera, imageQuality: 50);

    setState(() {
      if (pickedFile != null) {
        profileImage = File(pickedFile.path);
      } else {}
    });
  }

  imgFromGallery() async {
    final pickedFile =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      if (pickedFile != null) {
        profileImage = File(pickedFile.path);
        // locator<AuthService>().userProfile!.imageUrldCopy = null;
      } else {}
    });
  }

  createUserAccount() async {
    debugPrint('@CreateingUserAccount!');

    authResult = await authService.signUpWithEmailandPassword(user);
    if (authResult.status == true) {
      user.fcmToken = await FirebaseMessaging.instance.getToken();

      await dbService.updateFcmToken(user.fcmToken, authResult.user!.uid);
      debugPrint('Now heading to HomeScreen!!');

      Get.to(() => const HomeScreenAplicant());
    } else {
      Get.dialog(const AuthDialog(
        title: 'Authentication Failed',
        message:
            'There has been an error due to which you could not be signed in. Please try again later.',
      ));
    }
  }

  toogleIsInstitution() {
    if (user.isInstitution == null) {
      user.isInstitution = false;
      user.isInstitution = !user.isInstitution!;
    } else {
      user.isInstitution = !user.isInstitution!;
    }
    notifyListeners();
  }

  /// Get from Gallery
  getFromGallery() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      profileImage = File(pickedFile.path);
    }
    notifyListeners();
  }

  /// Get from Camera
  getFromCamera() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      profileImage = File(pickedFile.path);
    }
    notifyListeners();
  }

  uplaodImage(File image) async {
    busyState = true;
    notifyListeners();
    user.imageUrl = await firebaseStorage.uploadImage(image, 'userImages');
    debugPrint("IMGAE URL --->> ${user.imageUrl}");
    await createUserAccount();
    busyState = false;
    notifyListeners();
  }
}
