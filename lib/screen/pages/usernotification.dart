import 'package:flutter/material.dart';

class UserNotification {
  static void show(BuildContext context, String message) {
    // Show a notification to the user
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}