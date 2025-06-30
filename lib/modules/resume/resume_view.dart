// File: lib/app/modules/resume/resume_view.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_slate/app/widgets/app_button.dart';
import 'resume_controller.dart';

class ResumeView extends StatelessWidget {
  const ResumeView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ResumeController>();
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Build Resume')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Resume Information',
                style: theme.textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 24),

            // Personal Info
            TextField(
              controller: controller.fullName,
              decoration: const InputDecoration(labelText: 'Full Name'),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: controller.email,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: controller.phone,
              decoration: const InputDecoration(labelText: 'Phone Number'),
            ),

            const SizedBox(height: 24),
            // Education
            TextField(
              controller: controller.education,
              decoration: const InputDecoration(labelText: 'Education'),
            ),
            const SizedBox(height: 12),

            // Experience
            TextField(
              controller: controller.experience,
              maxLines: 3,
              decoration: const InputDecoration(labelText: 'Experience'),
            ),
            const SizedBox(height: 12),

            // Skills
            TextField(
              controller: controller.skills,
              decoration: const InputDecoration(labelText: 'Skills (comma separated)'),
            ),
            const SizedBox(height: 24),

            Obx(() => AppButton(
              text: 'Generate Resume',
              isLoading: controller.isGenerating.value,
              onTap: controller.generateResume,
            )),

            const SizedBox(height: 12),
            AppButton(
              text: 'Go to Cover Letter',
              isPrimary: false,
              onTap: () => Get.toNamed('/cover-letter'),
            ),
          ],
        ),
      ),
    );
  }
}
