import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:job_slate/app/routes/app_pages.dart';

class PricingController extends GetxController {
  final box = GetStorage();

  /// Called when user skips pro plan
  void skip() {
    box.write('plan', 'free');
    Get.offAllNamed(AppPages.resume);
  }

  /// Simulates upgrade to pro plan
  void upgradeToPro() {
    // Normally you'd call Razorpay/Stripe or backend validation here.
    box.write('plan', 'pro');
    Get.snackbar("Success", "You’ve upgraded to Pro!");
    Get.offAllNamed(AppPages.resume);
  }
}
