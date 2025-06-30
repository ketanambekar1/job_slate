import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final bool isLoading;
  final bool isPrimary;

  const AppButton({
    super.key,
    required this.text,
    required this.onTap,
    this.isLoading = false,
    this.isPrimary = true,
  });

  @override
  Widget build(BuildContext context) {
    final color = isPrimary
        ? Theme.of(context).primaryColor
        : Colors.grey.shade300;

    return ElevatedButton(
      onPressed: isLoading ? null : onTap,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(48),
        backgroundColor: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: isLoading
          ? const SizedBox(
          height: 18, width: 18, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2))
          : Text(text, style: const TextStyle(color: Colors.white)),
    );
  }
}
