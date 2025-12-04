class RegisterTenantRequest {
  RegisterTenantRequest({
      this.adminEmailAddress, 
      this.adminFirstName, 
      this.adminLastName, 
      this.adminPassword, 
      this.captchaResponse, 
      this.editionId, 
      this.name, 
      this.tenancyName,});

  String? adminEmailAddress;
  String? adminFirstName;
  String? adminLastName;
  String? adminPassword;
  dynamic captchaResponse;
  String? editionId;
  String? name;
  String? tenancyName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['adminEmailAddress'] = adminEmailAddress;
    map['adminFirstName'] = adminFirstName;
    map['adminLastName'] = adminLastName;
    map['adminPassword'] = adminPassword;
    map['captchaResponse'] = captchaResponse;
    map['editionId'] = editionId;
    map['name'] = name;
    map['tenancyName'] = tenancyName;
    return map;
  }

}