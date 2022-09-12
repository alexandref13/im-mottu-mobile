import 'package:flutter/material.dart';

import '../themes/themes.dart';

abstract class SnackbarHelper {
  static void showFailure(
    BuildContext context, {
    String? message,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          '$message',
          textAlign: TextAlign.center,
        ),
        backgroundColor: PalleteColor.warning,
      ),
    );
  }

  static void showInfo(
    BuildContext context, {
    String? message,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          '$message',
          textAlign: TextAlign.center,
        ),
        backgroundColor: PalleteColor.info,
      ),
    );
  }

  static void showSuccess(
    BuildContext context, {
    String? message,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          '$message',
          textAlign: TextAlign.center,
        ),
        backgroundColor: PalleteColor.sucess,
      ),
    );
  }
}
