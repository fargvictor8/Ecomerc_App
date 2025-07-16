

import 'package:flutter/material.dart';

void showLoading(BuildContext context){

  showDialog(
    context: context,
    barrierDismissible: false, // المستخدم مش هيقدر يقفلها من غير ما تخلص العملية
    builder: (context) => Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularProgressIndicator(
              color: Colors.pink, // غير اللون حسب Theme بتاعك
              strokeWidth: 4,
            ),
            const SizedBox(height: 20),
            Text(
              "Loading...",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}