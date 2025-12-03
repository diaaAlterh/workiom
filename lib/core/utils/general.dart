import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

showToast(
    {required String message,
    bool vibrate = true,
    bool isErrorMessage = false}) {
  Fluttertoast.cancel();
  if (message == 'Unauthenticated.') {
    return;
  }
  Fluttertoast.showToast(
      msg: message,
      toastLength: isErrorMessage ? Toast.LENGTH_LONG : Toast.LENGTH_SHORT);

  if (isErrorMessage) {
    HapticFeedback.lightImpact();
  } else {
    HapticFeedback.lightImpact();
  }
}