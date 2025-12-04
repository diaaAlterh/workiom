class IsTenantAvailableRequest {
  IsTenantAvailableRequest({this.tenancyName});

  String? tenancyName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['tenancyName'] = tenancyName;
    return map;
  }
}
