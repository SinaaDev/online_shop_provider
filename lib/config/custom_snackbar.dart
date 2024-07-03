import 'package:flutter/material.dart';

class CustomSnackBar {
  final BuildContext context;
  final String message;
  final IconData? icon;
  final Color? backgroundColor;
  final Duration duration;

  CustomSnackBar({
    required this.context,
    required this.message,
    this.icon,
    this.backgroundColor,
    this.duration = const Duration(seconds: 3),
  });

  void show() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon!= null) Icon(icon, color: Colors.white),
            const SizedBox(width: 10),
            Text(message, style: const TextStyle(color: Colors.white)),
          ],
        ),
        backgroundColor: backgroundColor?? Colors.red,
        duration: duration,
      ),
    );
  }
}
