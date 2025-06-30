import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_slate/app/routes/app_pages.dart';
import 'package:job_slate/app/widgets/app_button.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('JobSlate'),
        backgroundColor: theme.primaryColor,
        actions: [
          TextButton(
            onPressed: () => Get.toNamed(AppPages.login),
            child: const Text('Login', style: TextStyle(color: Colors.white)),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
              color: theme.colorScheme.surfaceVariant,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Land Your Dream Job Faster with AI',
                    style: theme.textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Generate tailored resumes & cover letters in seconds',
                    style: theme.textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  AppButton(
                    text: 'Get Started',
                    onTap: () => Get.toNamed(AppPages.login),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Wrap(
                spacing: 20,
                runSpacing: 20,
                alignment: WrapAlignment.center,
                children: [
                  _FeatureCard(
                    icon: Icons.description,
                    title: 'Resume Builder',
                    desc: 'Build professional resumes with AI.',
                  ),
                  _FeatureCard(
                    icon: Icons.mail,
                    title: 'Cover Letter',
                    desc: 'Generate custom cover letters with context.',
                  ),
                  _FeatureCard(
                    icon: Icons.picture_as_pdf,
                    title: 'PDF Export',
                    desc: 'Download clean, ready-to-send resumes.',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            Text(
              'JobSlate © 2025',
              style: theme.textTheme.bodySmall,
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class _FeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String desc;

  const _FeatureCard({
    required this.icon,
    required this.title,
    required this.desc,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        width: 250,
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Icon(icon, size: 48, color: theme.primaryColor),
            const SizedBox(height: 12),
            Text(title, style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(desc, textAlign: TextAlign.center, style: theme.textTheme.bodyMedium),
          ],
        ),
      ),
    );
  }
}
