import '../../../core/core_models/error_response.dart';

class TenantAvailableModel {
  TenantAvailableModel({
    this.result,
    this.targetUrl,
    this.success,
    this.error,
    this.unAuthorizedRequest,
    this.abp,});

  TenantAvailableModel.fromJson(dynamic json) {
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
      this.state, 
      this.tenantId, 
      this.serverRootAddress, 
      this.apiUrl, 
      this.dnsUrl,});

  Result.fromJson(dynamic json) {
    state = json['state'];
    tenantId = json['tenantId'];
    serverRootAddress = json['serverRootAddress'];
    apiUrl = json['apiUrl'];
    dnsUrl = json['dnsUrl'];
  }
  int? state;
  int? tenantId;
  String? serverRootAddress;
  dynamic apiUrl;
  dynamic dnsUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['state'] = state;
    map['tenantId'] = tenantId;
    map['serverRootAddress'] = serverRootAddress;
    map['apiUrl'] = apiUrl;
    map['dnsUrl'] = dnsUrl;
    return map;
  }

}