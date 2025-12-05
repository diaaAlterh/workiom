import 'dart:io';

import 'package:flutter/material.dart';

class Constants {
  static const String appName = 'Workiom';

  static const String baseUrl = 'https://api.workiom.club/api/';

  static const String tokenKey = 'token';
  static const String refreshTokenKey = 'refresh_token';

  static const Duration connectTimeout = Duration(seconds: 30);
  static const Duration receiveTimeout = Duration(seconds: 30);
  static const Duration sendTimeout = Duration(seconds: 30);
  static const Duration prodConnectTimeout = Duration(seconds: 60);
  static const Duration prodReceiveTimeout = Duration(seconds: 60);
  static const Duration prodSendTimeout = Duration(seconds: 60);
}
enum Language{en,ar,tr}