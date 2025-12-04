import '../../../core/core_models/error_response.dart';

class PasswordComplexityModel {
  PasswordComplexityModel({
    this.result,
    this.targetUrl,
    this.success,
    this.error,
    this.unAuthorizedRequest,
    this.abp,});

  PasswordComplexityModel.fromJson(dynamic json) {
    result = json['result'] != null ? Result.fromJson(json['result']) : null;
    targetUrl = json['targetUrl'];
    success = json['success'];
    error = json['error'] != null ? ErrorResponse.fromJson(json['error']) : null;
    unAuthorizedRequest = json['unAuthorizedRequest'];
    abp = json['__abp'];
  }
  Result? result;
  dynamic targetUrl;
  bool? success;
  ErrorResponse? error;
  bool? unAuthorizedRequest;
  bool? abp;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (result != null) {
      map['result'] = result?.toJson();
    }
    map['targetUrl'] = targetUrl;
    map['success'] = success;
    if (error != null) {
      map['error'] = error?.toJson();
    }
    map['unAuthorizedRequest'] = unAuthorizedRequest;
    map['__abp'] = abp;
    return map;
  }

}

class Result {
  Result({
      this.setting,});

  Result.fromJson(dynamic json) {
    setting = json['setting'] != null ? Setting.fromJson(json['setting']) : null;
  }
  Setting? setting;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (setting != null) {
      map['setting'] = setting?.toJson();
    }
    return map;
  }

}

class Setting {
  Setting({
      this.requireDigit, 
      this.requireLowercase, 
      this.requireNonAlphanumeric, 
      this.requireUppercase, 
      this.requiredLength,});

  Setting.fromJson(dynamic json) {
    requireDigit = json['requireDigit'];
    requireLowercase = json['requireLowercase'];
    requireNonAlphanumeric = json['requireNonAlphanumeric'];
    requireUppercase = json['requireUppercase'];
    requiredLength = json['requiredLength'];
  }
  bool? requireDigit;
  bool? requireLowercase;
  bool? requireNonAlphanumeric;
  bool? requireUppercase;
  int? requiredLength;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['requireDigit'] = requireDigit;
    map['requireLowercase'] = requireLowercase;
    map['requireNonAlphanumeric'] = requireNonAlphanumeric;
    map['requireUppercase'] = requireUppercase;
    map['requiredLength'] = requiredLength;
    return map;
  }

}