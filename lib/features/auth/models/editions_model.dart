import '../../../core/core_models/error_response.dart';

class EditionsModel {
  EditionsModel({
    this.result,
    this.targetUrl,
    this.success,
    this.error,
    this.unAuthorizedRequest,
    this.abp,});

  EditionsModel.fromJson(dynamic json) {
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
      this.allFeatures, 
      this.editionsWithFeatures, 
      this.tenantEditionId,});

  Result.fromJson(dynamic json) {
    if (json['allFeatures'] != null) {
      allFeatures = [];
      json['allFeatures'].forEach((v) {
        allFeatures?.add(AllFeatures.fromJson(v));
      });
    }
    if (json['editionsWithFeatures'] != null) {
      editionsWithFeatures = [];
      json['editionsWithFeatures'].forEach((v) {
        editionsWithFeatures?.add(EditionsWithFeatures.fromJson(v));
      });
    }
    tenantEditionId = json['tenantEditionId'];
  }
  List<AllFeatures>? allFeatures;
  List<EditionsWithFeatures>? editionsWithFeatures;
  dynamic tenantEditionId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (allFeatures != null) {
      map['allFeatures'] = allFeatures?.map((v) => v.toJson()).toList();
    }
    if (editionsWithFeatures != null) {
      map['editionsWithFeatures'] = editionsWithFeatures?.map((v) => v.toJson()).toList();
    }
    map['tenantEditionId'] = tenantEditionId;
    return map;
  }

}

class EditionsWithFeatures {
  EditionsWithFeatures({
      this.edition, 
      this.featureValues,});

  EditionsWithFeatures.fromJson(dynamic json) {
    edition = json['edition'] != null ? Edition.fromJson(json['edition']) : null;
    if (json['featureValues'] != null) {
      featureValues = [];
      json['featureValues'].forEach((v) {
        featureValues?.add(FeatureValues.fromJson(v));
      });
    }
  }
  Edition? edition;
  List<FeatureValues>? featureValues;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (edition != null) {
      map['edition'] = edition?.toJson();
    }
    if (featureValues != null) {
      map['featureValues'] = featureValues?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class FeatureValues {
  FeatureValues({
      this.name, 
      this.value,});

  FeatureValues.fromJson(dynamic json) {
    name = json['name'];
    value = json['value'];
  }
  String? name;
  String? value;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['value'] = value;
    return map;
  }

}

class Edition {
  Edition({
      this.name, 
      this.displayName, 
      this.publicDescription, 
      this.internalDescription, 
      this.isPublished, 
      this.isRegistrable, 
      this.type, 
      this.minimumUsersCount, 
      this.monthlyPrice, 
      this.annualPrice, 
      this.waitingDayAfterExpire, 
      this.trialDayCount, 
      this.countAllowExtendTrial, 
      this.hasTrial, 
      this.disableWorkspaceAfterExpire, 
      this.isMostPopular, 
      this.doNotSendVerifyEmail, 
      this.expiringEdition, 
      this.seatsText, 
      this.buttonText, 
      this.buttonLink, 
      this.starterLineText, 
      this.editionColor, 
      this.id,});

  Edition.fromJson(dynamic json) {
    name = json['name'];
    displayName = json['displayName'];
    publicDescription = json['publicDescription'];
    internalDescription = json['internalDescription'];
    isPublished = json['isPublished'];
    isRegistrable = json['isRegistrable'];
    type = json['type'];
    minimumUsersCount = json['minimumUsersCount'];
    monthlyPrice = json['monthlyPrice'];
    annualPrice = json['annualPrice'];
    waitingDayAfterExpire = json['waitingDayAfterExpire'];
    trialDayCount = json['trialDayCount'];
    countAllowExtendTrial = json['countAllowExtendTrial'];
    hasTrial = json['hasTrial'];
    disableWorkspaceAfterExpire = json['disableWorkspaceAfterExpire'];
    isMostPopular = json['isMostPopular'];
    doNotSendVerifyEmail = json['doNotSendVerifyEmail'];
    expiringEdition = json['expiringEdition'];
    seatsText = json['seatsText'];
    buttonText = json['buttonText'];
    buttonLink = json['buttonLink'];
    starterLineText = json['starterLineText'];
    editionColor = json['editionColor'];
    id = json['id'];
  }
  String? name;
  String? displayName;
  String? publicDescription;
  dynamic internalDescription;
  bool? isPublished;
  bool? isRegistrable;
  int? type;
  dynamic minimumUsersCount;
  dynamic monthlyPrice;
  dynamic annualPrice;
  dynamic waitingDayAfterExpire;
  dynamic trialDayCount;
  dynamic countAllowExtendTrial;
  bool? hasTrial;
  bool? disableWorkspaceAfterExpire;
  dynamic isMostPopular;
  dynamic doNotSendVerifyEmail;
  dynamic expiringEdition;
  dynamic seatsText;
  dynamic buttonText;
  dynamic buttonLink;
  dynamic starterLineText;
  dynamic editionColor;
  int? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['displayName'] = displayName;
    map['publicDescription'] = publicDescription;
    map['internalDescription'] = internalDescription;
    map['isPublished'] = isPublished;
    map['isRegistrable'] = isRegistrable;
    map['type'] = type;
    map['minimumUsersCount'] = minimumUsersCount;
    map['monthlyPrice'] = monthlyPrice;
    map['annualPrice'] = annualPrice;
    map['waitingDayAfterExpire'] = waitingDayAfterExpire;
    map['trialDayCount'] = trialDayCount;
    map['countAllowExtendTrial'] = countAllowExtendTrial;
    map['hasTrial'] = hasTrial;
    map['disableWorkspaceAfterExpire'] = disableWorkspaceAfterExpire;
    map['isMostPopular'] = isMostPopular;
    map['doNotSendVerifyEmail'] = doNotSendVerifyEmail;
    map['expiringEdition'] = expiringEdition;
    map['seatsText'] = seatsText;
    map['buttonText'] = buttonText;
    map['buttonLink'] = buttonLink;
    map['starterLineText'] = starterLineText;
    map['editionColor'] = editionColor;
    map['id'] = id;
    return map;
  }

}

class AllFeatures {
  AllFeatures({
      this.name, 
      this.parentName, 
      this.displayName, 
      this.description, 
      this.defaultValue, 
      this.metadata, 
      this.inputType,});

  AllFeatures.fromJson(dynamic json) {
    name = json['name'];
    parentName = json['parentName'];
    displayName = json['displayName'];
    description = json['description'];
    defaultValue = json['defaultValue'];
    metadata = json['metadata'] != null ? Metadata.fromJson(json['metadata']) : null;
    inputType = json['inputType'] != null ? InputType.fromJson(json['inputType']) : null;
  }
  String? name;
  dynamic parentName;
  String? displayName;
  String? description;
  String? defaultValue;
  Metadata? metadata;
  InputType? inputType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['parentName'] = parentName;
    map['displayName'] = displayName;
    map['description'] = description;
    map['defaultValue'] = defaultValue;
    if (metadata != null) {
      map['metadata'] = metadata?.toJson();
    }
    if (inputType != null) {
      map['inputType'] = inputType?.toJson();
    }
    return map;
  }

}

class InputType {
  InputType({
      this.name, 
      this.attributes, 
      this.validator, 
      this.itemSource,});

  InputType.fromJson(dynamic json) {
    name = json['name'];
    attributes = json['attributes'];
    validator = json['validator'] != null ? Validator.fromJson(json['validator']) : null;
    itemSource = json['itemSource'];
  }
  String? name;
  dynamic attributes;
  Validator? validator;
  dynamic itemSource;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['attributes'] = attributes;
    if (validator != null) {
      map['validator'] = validator?.toJson();
    }
    map['itemSource'] = itemSource;
    return map;
  }

}

class Validator {
  Validator({
      this.name, 
      this.attributes,});

  Validator.fromJson(dynamic json) {
    name = json['name'];
    attributes = json['attributes'];
  }
  String? name;
  dynamic attributes;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['attributes'] = attributes;
    return map;
  }

}

class Metadata {
  Metadata({
      this.dataType, 
      this.isVisibleOnPricingTable, 
      this.isVisibleOnTenantSubscription,});

  Metadata.fromJson(dynamic json) {
    dataType = json['dataType'];
    isVisibleOnPricingTable = json['isVisibleOnPricingTable'];
    isVisibleOnTenantSubscription = json['isVisibleOnTenantSubscription'];
  }
  int? dataType;
  bool? isVisibleOnPricingTable;
  bool? isVisibleOnTenantSubscription;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['dataType'] = dataType;
    map['isVisibleOnPricingTable'] = isVisibleOnPricingTable;
    map['isVisibleOnTenantSubscription'] = isVisibleOnTenantSubscription;
    return map;
  }

}