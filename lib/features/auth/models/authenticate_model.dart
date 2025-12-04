import '../../../core/core_models/error_response.dart';

class AuthenticateModel {
  AuthenticateModel({
    this.result,
    this.targetUrl,
    this.success,
    this.error,
    this.unAuthorizedRequest,
    this.abp,});

  AuthenticateModel.fromJson(dynamic json) {
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
      this.accessToken, 
      this.encryptedAccessToken, 
      this.expireInSeconds, 
      this.shouldResetPassword, 
      this.passwordResetCode, 
      this.passwordExpired, 
      this.userId, 
      this.requiresTwoFactorVerification, 
      this.twoFactorAuthProviders, 
      this.twoFactorRememberClientToken, 
      this.returnUrl, 
      this.refreshToken, 
      this.refreshTokenExpireInSeconds, 
      this.captchaResult,});

  Result.fromJson(dynamic json) {
    accessToken = json['accessToken'];
    encryptedAccessToken = json['encryptedAccessToken'];
    expireInSeconds = json['expireInSeconds'];
    shouldResetPassword = json['shouldResetPassword'];
    passwordResetCode = json['passwordResetCode'];
    passwordExpired = json['passwordExpired'];
    userId = json['userId'];
    requiresTwoFactorVerification = json['requiresTwoFactorVerification'];
    twoFactorAuthProviders = json['twoFactorAuthProviders'];
    twoFactorRememberClientToken = json['twoFactorRememberClientToken'];
    returnUrl = json['returnUrl'];
    refreshToken = json['refreshToken'];
    refreshTokenExpireInSeconds = json['refreshTokenExpireInSeconds'];
    captchaResult = json['captchaResult'];
  }
  String? accessToken;
  String? encryptedAccessToken;
  int? expireInSeconds;
  bool? shouldResetPassword;
  dynamic passwordResetCode;
  bool? passwordExpired;
  int? userId;
  bool? requiresTwoFactorVerification;
  dynamic twoFactorAuthProviders;
  dynamic twoFactorRememberClientToken;
  dynamic returnUrl;
  String? refreshToken;
  int? refreshTokenExpireInSeconds;
  dynamic captchaResult;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['accessToken'] = accessToken;
    map['encryptedAccessToken'] = encryptedAccessToken;
    map['expireInSeconds'] = expireInSeconds;
    map['shouldResetPassword'] = shouldResetPassword;
    map['passwordResetCode'] = passwordResetCode;
    map['passwordExpired'] = passwordExpired;
    map['userId'] = userId;
    map['requiresTwoFactorVerification'] = requiresTwoFactorVerification;
    map['twoFactorAuthProviders'] = twoFactorAuthProviders;
    map['twoFactorRememberClientToken'] = twoFactorRememberClientToken;
    map['returnUrl'] = returnUrl;
    map['refreshToken'] = refreshToken;
    map['refreshTokenExpireInSeconds'] = refreshTokenExpireInSeconds;
    map['captchaResult'] = captchaResult;
    return map;
  }

}