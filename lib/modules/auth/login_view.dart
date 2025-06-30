import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_slate/app/widgets/app_button.dart';
import 'login_controller.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LoginController>();
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login to JobSlate'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 400),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Welcome Back',
                    style: theme.textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Text('Login with your email to continue.',
                    style: theme.textTheme.bodyLarge),
                const SizedBox(height: 24),

                TextField(
                  controller: controller.emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 16),

                TextField(
                  controller: controller.passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 24),

                Obx(() => AppButton(
                  text: 'Login',
                  isLoading: controller.isLoading.value,
                  onTap: controller.login,
                )),

                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?"),
                    TextButton(
                      onPressed: controller.toggleMode,
                      child: const Text('Sign up'),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}