import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:t_store/common/widgets/loaders/loaders.dart';
import 'package:t_store/data/repositories/user/user_repository.dart';

import '../../authentication/models/user_model.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final userRepository = Get.put(UserRepository());
  final Rx<UserModel> user = UserModel.empty().obs;
  final RxBool imageUploading = false.obs;

  @override
  void onInit() async {
    super.onInit();
    fetchUserRecord();
  }

  Future<void> fetchUserRecord() async {
    try {
      user.value = await userRepository.fetchUserDetails();
    } catch (e) {
      user(UserModel.empty());
    }
  }

  /// Save user to DB
  Future<void> saveUserRecord(UserCredential? userCredential) async {
    try {
      await fetchUserRecord();
      if (userCredential != null) {
        final nameParts = UserModel.nameParts(userCredential.user!.displayName ?? "");
        final userName = UserModel.generateUserName(userCredential.user!.displayName ?? "");
        final user = UserModel(
            id: userCredential.user!.uid,
            firstName: nameParts[0],
            lastName: nameParts.length > 1 ? nameParts.sublist(1).join(" ") : "",
            userName: userName,
            email: userCredential.user!.email ?? "",
            phoneNumber: userCredential.user!.phoneNumber ?? "",
            profilePicture: userCredential.user!.photoURL ?? "");

        /// save
        userRepository.saveUserRecord(user);
      }
    } catch (e) {
      TLoaders.warningSnackBar(
          title: "Data not saved",
          message: "something went wrong while saving your data. You can re-save your data in your profile.");
    }
  }

  /// Update user
  Future<void> updateUserName(String name, String lastName) async {
    userRepository.updateSingleField({"FirstName": name, "LastName": lastName});
  }

  /// Delete user
  Future<void> deleteUser() async {
    userRepository.removeUserRecord(user.value.id);
  }

  /// Upload image
  Future<void> uploadUserProfileImage() async {
    try {
      final image =
          await ImagePicker().pickImage(source: ImageSource.gallery, imageQuality: 70, maxHeight: 512, maxWidth: 512);
      if (image != null) {
        imageUploading(true);
        final imgUrl = await userRepository.uploadImage("Users/Images/Profile/", image);
        await userRepository.updateSingleField({"ProfilePicture": imgUrl});
        user.value.profilePicture = imgUrl;
        // user.refresh();
        TLoaders.successSnackBar(title: "Congratulations", message: "Your profile image hase been updated.");
      }
    } catch (e) {
      TLoaders.errorSnackBar(title: "Oh Snap", message: "Something went wrong: ${e.toString()}");
    } finally {
      imageUploading(false);
    }
  }
}
