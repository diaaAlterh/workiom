class ErrorResponse {
  ErrorResponse({
      this.code, 
      this.message, 
      this.details, 
      this.validationErrors,});

  ErrorResponse.fromJson(dynamic json) {
    code = json['code'];
    message = json['message'];
    details = json['details'];
    if (json['validationErrors'] != null) {
      validationErrors = [];
      json['validationErrors'].forEach((v) {
        validationErrors?.add(ValidationErrors.fromJson(v));
      });
    }
  }
  int? code;
  String? message;
  String? details;
  List<ValidationErrors>? validationErrors;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = code;
    map['message'] = message;
    map['details'] = details;
    if (validationErrors != null) {
      map['validationErrors'] = validationErrors?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class ValidationErrors {
  ValidationErrors({
      this.message, 
      this.members,});

  ValidationErrors.fromJson(dynamic json) {
    message = json['message'];
    members = json['members'] != null ? json['members'].cast<String>() : [];
  }
  String? message;
  List<String>? members;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['members'] = members;
    return map;
  }

}