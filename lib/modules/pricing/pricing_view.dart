// File: lib/app/modules/pricing/pricing_view.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_slate/app/widgets/app_button.dart';
import 'pricing_controller.dart';

class PricingView extends StatelessWidget {
  const PricingView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<PricingController>();
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Choose a Plan')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Upgrade to Pro',
                style: theme.textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text('Select the plan that suits your job hunt.', style: theme.textTheme.bodyLarge),
            const SizedBox(height: 24),
            Row(
              children: const [
                Expanded(child: _PlanCard(isPro: false)),
                SizedBox(width: 16),
                Expanded(child: _PlanCard(isPro: true)),
              ],
            ),
            const Spacer(),
            AppButton(
              text: 'Skip for now',
              isPrimary: false,
              onTap: controller.skip,
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}

class _PlanCard extends StatelessWidget {
  final bool isPro;

  const _PlanCard({required this.isPro});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final planTitle = isPro ? 'Pro Plan' : 'Free Plan';
    final price = isPro ? '₹99/month' : 'Free';
    final features = isPro
        ? ['Unlimited Resume PDFs', 'AI Cover Letters', 'Priority Support']
        : ['1 Resume PDF/month', 'No Cover Letters', 'Email Support'];

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(planTitle, style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(price, style: theme.textTheme.titleMedium?.copyWith(color: theme.primaryColor)),
            const SizedBox(height: 12),
            ...features.map((f) => Row(
              children: [
                Icon(Icons.check, size: 16, color: theme.primaryColor),
                const SizedBox(width: 8),
                Expanded(child: Text(f)),
              ],
            )),
            const Spacer(),
            if (isPro)
              AppButton(
                text: 'Upgrade Now',
                onTap: () => Get.find<PricingController>().upgradeToPro(),
              ),
          ],
        ),
      ),
    );
  }
}