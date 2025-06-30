import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_slate/data/services/gpt_service.dart';

class CoverLetterController extends GetxController {
  final nameController = TextEditingController();
  final jobTitleController = TextEditingController();
  final companyController = TextEditingController();

  final generatedText = ''.obs;

  void generateCoverLetter() async {
    final name = nameController.text.trim();
    final jobTitle = jobTitleController.text.trim();
    final company = companyController.text.trim();

    if (name.isEmpty || jobTitle.isEmpty || company.isEmpty) {
      Get.snackbar('Error', 'Please fill all fields');
      return;
    }

    generatedText.value = "Generating...";
    try {
      final result = await GPTService.generateCoverLetter(
        name: name,
        jobTitle: jobTitle,
        company: company,
      );
      generatedText.value = result;
    } catch (e) {
      generatedText.value = '';
      Get.snackbar('Error', 'Failed to generate: $e');
    }
  }

//   void generateCoverLetter() {
//     final name = nameController.text.trim();
//     final jobTitle = jobTitleController.text.trim();
//     final company = companyController.text.trim();
//
//     if (name.isEmpty || jobTitle.isEmpty || company.isEmpty) {
//       Get.snackbar('Error', 'Please fill all fields');
//       return;
//     }
//
//     // Placeholder for AI-generated content
//     generatedText.value = '''
// Dear Hiring Manager at $company,
//
// I'm writing to express my interest in the $jobTitle position at your esteemed organization. With my experience and passion for this role, I believe I can contribute meaningfully to your team.
//
// Thank you for considering my application.
//
// Best regards,
// $name
// ''';
//   }

  @override
  void onClose() {
    nameController.dispose();
    jobTitleController.dispose();
    companyController.dispose();
    super.onClose();
  }
}
