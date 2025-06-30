import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResumeController extends GetxController {
  final fullName = TextEditingController();
  final email = TextEditingController();
  final phone = TextEditingController();
  final education = TextEditingController();
  final experience = TextEditingController();
  final skills = TextEditingController();

  final isGenerating = false.obs;

  void generateResume() async {
    if (fullName.text.isEmpty || email.text.isEmpty) {
      Get.snackbar('Error', 'Full name and email are required.');
      return;
    }

    isGenerating.value = true;

    try {
      // Simulate a generation delay
      await Future.delayed(const Duration(seconds: 2));

      // TODO: Generate actual PDF using flutter_pdf or syncfusion_pdf
      Get.snackbar('Success', 'Resume generated successfully!');
    } catch (e) {
      Get.snackbar('Error', 'Failed to generate resume: $e');
    } finally {
      isGenerating.value = false;
    }
  }

  @override
  void onClose() {
    fullName.dispose();
    email.dispose();
    phone.dispose();
    education.dispose();
    experience.dispose();
    skills.dispose();
    super.onClose();
  }
}
