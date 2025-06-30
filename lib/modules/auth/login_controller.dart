import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:job_slate/app/routes/app_pages.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final isLoading = false.obs;
  final isLoginMode = true.obs; // true: login, false: register

  final auth = FirebaseAuth.instance;
  final box = GetStorage();

  void toggleMode() {
    isLoginMode.value = !isLoginMode.value;
  }

  void login() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      Get.snackbar("Error", "Please fill all fields");
      return;
    }

    isLoading.value = true;

    try {
      if (isLoginMode.value) {
        await auth.signInWithEmailAndPassword(email: email, password: password);
      } else {
        await auth.createUserWithEmailAndPassword(email: email, password: password);
      }

      // Save login state
      box.write('user_email', email);

      // Navigate to pricing
      Get.offAllNamed(AppPages.pricing);
    } catch (e) {
      Get.snackbar("Authentication Failed", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}