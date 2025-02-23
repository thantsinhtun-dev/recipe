import 'package:flutter/material.dart';
import 'package:touchable_opacity/touchable_opacity.dart';

import '../../core/core.dart';

extension DialogExt on BuildContext {
  showLoading() {
    showDialog(
      context: this,
      barrierDismissible: false,
      builder: (_) => const Center(
        child: PopScope(
          canPop: false,
          child: SizedBox(
            width: 30,
            height: 30,
            child: CircularProgressIndicator(
              strokeWidth: 5,
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }

  hideKeyboard() {
    FocusScope.of(this).unfocus();
  }

  hideLoading() {
    Navigator.of(this).pop();
  }

  showErrorDialog({
    required String title,
    required String msg,
  }) {
    showDialog(
      context: this,
      barrierDismissible: false,
      builder: (_) {
        return AlertDialog(
          title: Text(title),
          content: Text(msg),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(this).pop(),
              child: const Text('OK'),
            ),
        ]
        );
      }
    );
  }
}
