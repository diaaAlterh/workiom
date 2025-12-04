import '../../../core/core_models/error_response.dart';

class RegisterTenantModel {
  RegisterTenantModel({
      this.result, 
      this.targetUrl, 
      this.success, 
      this.error, 
      this.unAuthorizedRequest, 
      this.abp,});

  RegisterTenantModel.fromJson(dynamic json) {
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
      this.tenantId, 
      this.tenancyName, 
      this.name, 
      this.userName, 
      this.emailAddress, 
      this.isTenantActive, 
      this.isActive, 
      this.isEmailConfirmationRequired, 
      this.captchaResult,});

  Result.fromJson(dynamic json) {
    tenantId = json['tenantId'];
    tenancyName = json['tenancyName'];
    name = json['name'];
    userName = json['userName'];
    emailAddress = json['emailAddress'];
    isTenantActive = json['isTenantActive'];
    isActive = json['isActive'];
    isEmailConfirmationRequired = json['isEmailConfirmationRequired'];
    captchaResult = json['captchaResult'];
  }
  int? tenantId;
  String? tenancyName;
  String? name;
  String? userName;
  String? emailAddress;
  bool? isTenantActive;
  bool? isActive;
  bool? isEmailConfirmationRequired;
  dynamic captchaResult;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['tenantId'] = tenantId;
    map['tenancyName'] = tenancyName;
    map['name'] = name;
    map['userName'] = userName;
    map['emailAddress'] = emailAddress;
    map['isTenantActive'] = isTenantActive;
    map['isActive'] = isActive;
    map['isEmailConfirmationRequired'] = isEmailConfirmationRequired;
    map['captchaResult'] = captchaResult;
    return map;
  }

}