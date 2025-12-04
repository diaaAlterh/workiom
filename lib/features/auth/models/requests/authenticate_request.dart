class AuthenticateRequest {
  AuthenticateRequest({
      this.userNameOrEmailAddress, 
      this.ianaTimeZone, 
      this.password, 
      this.returnUrl, 
      this.rememberClient, 
      this.singleSignIn, 
      this.tenantName,});

  String? userNameOrEmailAddress;
  String? ianaTimeZone;
  String? password;
  dynamic returnUrl;
  bool? rememberClient;
  bool? singleSignIn;
  String? tenantName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userNameOrEmailAddress'] = userNameOrEmailAddress;
    map['ianaTimeZone'] = ianaTimeZone;
    map['password'] = password;
    map['returnUrl'] = returnUrl;
    map['rememberClient'] = rememberClient;
    map['singleSignIn'] = singleSignIn;
    map['tenantName'] = tenantName;
    return map;
  }

}