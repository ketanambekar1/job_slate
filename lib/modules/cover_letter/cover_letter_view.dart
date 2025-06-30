import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_slate/app/widgets/app_button.dart';
import 'cover_letter_controller.dart';

class CoverLetterView extends StatelessWidget {
  const CoverLetterView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CoverLetterController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("AI Cover Letter Generator"),
        centerTitle: true,
        elevation: 0,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isWide = constraints.maxWidth > 800;
          return Padding(
            padding: const EdgeInsets.all(20),
            child: isWide
                ? Row(
              children: [
                Expanded(child: _form(controller)),
                const SizedBox(width: 40),
                Expanded(child: _output(controller)),
              ],
            )
                : Column(
              children: [
                _form(controller),
                const SizedBox(height: 20),
                _output(controller),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _form(CoverLetterController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _field("Your Name", controller.nameController),
        const SizedBox(height: 12),
        _field("Job Title", controller.jobTitleController),
        const SizedBox(height: 12),
        _field("Company Name", controller.companyController),
        const SizedBox(height: 24),
        Obx(() => AppButton(
          text: "Generate Cover Letter",
          isLoading: controller.generatedText.value == "Generating...",
          onTap: controller.generateCoverLetter,
        )),
      ],
    );
  }

  Widget _field(String label, TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  Widget _output(CoverLetterController controller) {
    return Obx(() {
      if (controller.generatedText.value.isEmpty) {
        return const SizedBox.shrink();
      }

      return Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Theme.of(Get.context!).cardColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: SingleChildScrollView(
          child: Text(controller.generatedText.value),
        ),
      );
    });
  }
}
