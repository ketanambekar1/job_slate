import 'package:get/get.dart';
import 'package:job_slate/modules/auth/login_controller.dart';
import 'package:job_slate/modules/auth/login_view.dart';
import 'package:job_slate/modules/cover_letter/cover_letter_controller.dart';
import 'package:job_slate/modules/cover_letter/cover_letter_view.dart';
import 'package:job_slate/modules/home/home_controller.dart';
import 'package:job_slate/modules/home/home_view.dart';
import 'package:job_slate/modules/pricing/pricing_controller.dart';
import 'package:job_slate/modules/pricing/pricing_view.dart';
import 'package:job_slate/modules/resume/resume_controller.dart';
import 'package:job_slate/modules/resume/resume_view.dart';

class AppPages {
  static const initial = '/';
  static const login = '/login';
  static const pricing = '/pricing';
  static const coverLetter = '/cover-letter';
  static const resume = '/resume';

  static final routes = [
    GetPage(
      name: initial,
      page: () => const HomeView(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => HomeController());
      }),
    ),
    GetPage(
      name: coverLetter,
      page: () => const CoverLetterView(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => CoverLetterController());
      }),
    ),
    GetPage(
      name: login,
      page: () => const LoginView(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => LoginController());
      }),
    ),
    GetPage(
      name: pricing,
      page: () => const PricingView(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => PricingController());
      }),
    ),
    GetPage(
      name: resume,
      page: () => const ResumeView(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => ResumeController());
      }),
    ),
  ];
}
