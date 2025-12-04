import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:workiom/core/core_models/error_response.dart';
import 'failure.dart';

class ErrorHandler implements Exception {
  static Failure handle(dynamic error) {
    return Failure(
      statusCode: 403,
      statusMessage: error?.toString() ?? 'msg_not_internet'.tr(),
    );
  }

  static Failure handleDioError(DioException error) {
    try {
      dynamic responseData = error.response?.data['error'];

      final statusCode = error.response?.statusCode ?? 400;

      final errorResponse = ErrorResponse.fromJson(responseData);

      return Failure(
        statusCode: statusCode,
        statusMessage: errorResponse.details ?? '',
      );
    } catch (e) {
      return Failure(statusCode: 500, statusMessage: "msg_not_internet".tr());
    }
  }
}
