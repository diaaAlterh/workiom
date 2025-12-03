import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'failure.dart';

class ErrorHandler implements Exception {
  static Failure handle(dynamic error) {
    return Failure(
      statusCode: 403,
      statusMessage: error?.toString() ?? 'an_error_occurred'.tr(),
    );
  }

  static Failure handleDioError(DioException error) {
    try {
      // Ensure response data is parsed into a Map
      dynamic responseData = error.response?.data;
      if (responseData is String) {
        try {
          responseData = json.decode(responseData);
        } catch (_) {
          responseData = null;
        }
      }

      final statusCode = error.response?.statusCode ?? 400;

      // Try to extract backend message
      final backendMessage = responseData is Map<String, dynamic>
          ? responseData['message'] ??
          _extractErrorMessages(responseData)
          : null;

      // Fallbacks
      final fallbackMessage = (error.message?.contains('sijilicare.') ?? false)
          ? "msg_not_internet".tr()
          : error.message ?? 'an_error_occurred'.tr();

      return Failure(
        statusCode: statusCode,
        statusMessage: backendMessage?.toString().trim().isNotEmpty == true
            ? backendMessage.toString().trim()
            : fallbackMessage,
      );
    } catch (e) {
      return Failure(
        statusCode: 500,
        statusMessage: (error.message?.contains('sijilicare.') ?? false)
            ? "msg_not_internet".tr()
            : error.message ?? 'an_error_occurred'.tr(),
      );
    }
  }

  static String? _extractErrorMessages(Map<String, dynamic>? responseBody) {
    final data = responseBody?['data'];
    if (data != null && data is Map<String, dynamic>) {
      final buffer = StringBuffer();
      bool hasErrors = false;

      data.forEach((key, value) {
        if (value is List) {
          for (final error in value) {
            buffer.writeln(error);
            hasErrors = true;
          }
        }
      });

      if (hasErrors) {
        return buffer.toString().trim();
      }
    }
    return null;
  }
}
