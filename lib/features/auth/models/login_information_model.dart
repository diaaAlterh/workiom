import '../../../core/core_models/error_response.dart';

class LoginInformationModel {
  LoginInformationModel({
    this.result,
    this.targetUrl,
    this.success,
    this.error,
    this.unAuthorizedRequest,
    this.abp,});

  LoginInformationModel.fromJson(dynamic json) {
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
      this.user, 
      this.tenant, 
      this.application,});

  Result.fromJson(dynamic json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    tenant = json['tenant'] != null ? Tenant.fromJson(json['tenant']) : null;
    application = json['application'] != null ? Application.fromJson(json['application']) : null;
  }
  User? user;
  Tenant? tenant;
  Application? application;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (user != null) {
      map['user'] = user?.toJson();
    }
    if (tenant != null) {
      map['tenant'] = tenant?.toJson();
    }
    if (application != null) {
      map['application'] = application?.toJson();
    }
    return map;
  }

}

class Application {
  Application({
      this.version, 
      this.releaseDate, 
      this.currency, 
      this.currencySign, 
      this.userDelegationIsEnabled, 
      this.features, 
      this.compatibleMobileClientVersion, 
      this.compatibleWebClientVersion,});

  Application.fromJson(dynamic json) {
    version = json['version'];
    releaseDate = json['releaseDate'];
    currency = json['currency'];
    currencySign = json['currencySign'];
    userDelegationIsEnabled = json['userDelegationIsEnabled'];
    features = json['features'];
    compatibleMobileClientVersion = json['compatibleMobileClientVersion'];
    compatibleWebClientVersion = json['compatibleWebClientVersion'];
  }
  String? version;
  String? releaseDate;
  String? currency;
  String? currencySign;
  bool? userDelegationIsEnabled;
  dynamic features;
  String? compatibleMobileClientVersion;
  String? compatibleWebClientVersion;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['version'] = version;
    map['releaseDate'] = releaseDate;
    map['currency'] = currency;
    map['currencySign'] = currencySign;
    map['userDelegationIsEnabled'] = userDelegationIsEnabled;
    map['features'] = features;
    map['compatibleMobileClientVersion'] = compatibleMobileClientVersion;
    map['compatibleWebClientVersion'] = compatibleWebClientVersion;
    return map;
  }

}

class Tenant {
  Tenant({
      this.tenancyName, 
      this.name, 
      this.ownerId, 
      this.logoUrl, 
      this.watermarkUrl, 
      this.creationTime, 
      this.edition, 
      this.isInReadOnlyMode, 
      this.isSubscribed, 
      this.paymentPeriodType, 
      this.subscriptionEndDateUtc, 
      this.subscriptionCancelDateUtc, 
      this.isSubscriptionCanceled, 
      this.subscriptionCustomName, 
      this.trialPeriodStartDateUtc, 
      this.trialPeriodEndDateUtc, 
      this.allowExtendTrial, 
      this.isInTrialPeriod, 
      this.isUsingTrial, 
      this.trialPeriodDaysDuration, 
      this.hasCoupon, 
      this.isInLastPaidEdition, 
      this.waitingDayAfterExpire, 
      this.disableTenantAfterExpire, 
      this.moveToEditionAfterExpire, 
      this.setInReadOnlyModeAfterExpire, 
      this.templateCategoryId, 
      this.siloId, 
      this.apiUrl, 
      this.dnsUrl, 
      this.customerId, 
      this.id,});

  Tenant.fromJson(dynamic json) {
    tenancyName = json['tenancyName'];
    name = json['name'];
    ownerId = json['ownerId'];
    logoUrl = json['logoUrl'];
    watermarkUrl = json['watermarkUrl'];
    creationTime = json['creationTime'];
    edition = json['edition'] != null ? Edition.fromJson(json['edition']) : null;
    isInReadOnlyMode = json['isInReadOnlyMode'];
    isSubscribed = json['isSubscribed'];
    paymentPeriodType = json['paymentPeriodType'];
    subscriptionEndDateUtc = json['subscriptionEndDateUtc'];
    subscriptionCancelDateUtc = json['subscriptionCancelDateUtc'];
    isSubscriptionCanceled = json['isSubscriptionCanceled'];
    subscriptionCustomName = json['subscriptionCustomName'];
    trialPeriodStartDateUtc = json['trialPeriodStartDateUtc'];
    trialPeriodEndDateUtc = json['trialPeriodEndDateUtc'];
    allowExtendTrial = json['allowExtendTrial'];
    isInTrialPeriod = json['isInTrialPeriod'];
    isUsingTrial = json['isUsingTrial'];
    trialPeriodDaysDuration = json['trialPeriodDaysDuration'];
    hasCoupon = json['hasCoupon'];
    isInLastPaidEdition = json['isInLastPaidEdition'];
    waitingDayAfterExpire = json['waitingDayAfterExpire'];
    disableTenantAfterExpire = json['disableTenantAfterExpire'];
    moveToEditionAfterExpire = json['moveToEditionAfterExpire'];
    setInReadOnlyModeAfterExpire = json['setInReadOnlyModeAfterExpire'];
    templateCategoryId = json['templateCategoryId'];
    siloId = json['siloId'];
    apiUrl = json['apiUrl'];
    dnsUrl = json['dnsUrl'];
    customerId = json['customerId'];
    id = json['id'];
  }
  String? tenancyName;
  String? name;
  int? ownerId;
  dynamic logoUrl;
  dynamic watermarkUrl;
  String? creationTime;
  Edition? edition;
  bool? isInReadOnlyMode;
  bool? isSubscribed;
  dynamic paymentPeriodType;
  dynamic subscriptionEndDateUtc;
  dynamic subscriptionCancelDateUtc;
  bool? isSubscriptionCanceled;
  dynamic subscriptionCustomName;
  dynamic trialPeriodStartDateUtc;
  dynamic trialPeriodEndDateUtc;
  bool? allowExtendTrial;
  bool? isInTrialPeriod;
  bool? isUsingTrial;
  dynamic trialPeriodDaysDuration;
  bool? hasCoupon;
  bool? isInLastPaidEdition;
  int? waitingDayAfterExpire;
  bool? disableTenantAfterExpire;
  dynamic moveToEditionAfterExpire;
  bool? setInReadOnlyModeAfterExpire;
  dynamic templateCategoryId;
  dynamic siloId;
  dynamic apiUrl;
  dynamic dnsUrl;
  dynamic customerId;
  int? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['tenancyName'] = tenancyName;
    map['name'] = name;
    map['ownerId'] = ownerId;
    map['logoUrl'] = logoUrl;
    map['watermarkUrl'] = watermarkUrl;
    map['creationTime'] = creationTime;
    if (edition != null) {
      map['edition'] = edition?.toJson();
    }
    map['isInReadOnlyMode'] = isInReadOnlyMode;
    map['isSubscribed'] = isSubscribed;
    map['paymentPeriodType'] = paymentPeriodType;
    map['subscriptionEndDateUtc'] = subscriptionEndDateUtc;
    map['subscriptionCancelDateUtc'] = subscriptionCancelDateUtc;
    map['isSubscriptionCanceled'] = isSubscriptionCanceled;
    map['subscriptionCustomName'] = subscriptionCustomName;
    map['trialPeriodStartDateUtc'] = trialPeriodStartDateUtc;
    map['trialPeriodEndDateUtc'] = trialPeriodEndDateUtc;
    map['allowExtendTrial'] = allowExtendTrial;
    map['isInTrialPeriod'] = isInTrialPeriod;
    map['isUsingTrial'] = isUsingTrial;
    map['trialPeriodDaysDuration'] = trialPeriodDaysDuration;
    map['hasCoupon'] = hasCoupon;
    map['isInLastPaidEdition'] = isInLastPaidEdition;
    map['waitingDayAfterExpire'] = waitingDayAfterExpire;
    map['disableTenantAfterExpire'] = disableTenantAfterExpire;
    map['moveToEditionAfterExpire'] = moveToEditionAfterExpire;
    map['setInReadOnlyModeAfterExpire'] = setInReadOnlyModeAfterExpire;
    map['templateCategoryId'] = templateCategoryId;
    map['siloId'] = siloId;
    map['apiUrl'] = apiUrl;
    map['dnsUrl'] = dnsUrl;
    map['customerId'] = customerId;
    map['id'] = id;
    return map;
  }

}

class Edition {
  Edition({
      this.name, 
      this.displayName, 
      this.type, 
      this.id,});

  Edition.fromJson(dynamic json) {
    name = json['name'];
    displayName = json['displayName'];
    type = json['type'];
    id = json['id'];
  }
  String? name;
  String? displayName;
  int? type;
  int? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['displayName'] = displayName;
    map['type'] = type;
    map['id'] = id;
    return map;
  }

}

class User {
  User({
      this.name, 
      this.surname, 
      this.userName, 
      this.emailAddress, 
      this.profilePictureUrl, 
      this.allowSetPassword, 
      this.userType, 
      this.userToken, 
      this.lastSeen, 
      this.title, 
      this.roles, 
      this.id,});

  User.fromJson(dynamic json) {
    name = json['name'];
    surname = json['surname'];
    userName = json['userName'];
    emailAddress = json['emailAddress'];
    profilePictureUrl = json['profilePictureUrl'];
    allowSetPassword = json['allowSetPassword'];
    userType = json['userType'];
    userToken = json['userToken'];
    lastSeen = json['lastSeen'];
    title = json['title'];
    if (json['roles'] != null) {
      roles = [];
      json['roles'].forEach((v) {
        roles?.add((v));
      });
    }
    id = json['id'];
  }
  String? name;
  String? surname;
  String? userName;
  String? emailAddress;
  dynamic profilePictureUrl;
  bool? allowSetPassword;
  int? userType;
  String? userToken;
  dynamic lastSeen;
  dynamic title;
  List<dynamic>? roles;
  int? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['surname'] = surname;
    map['userName'] = userName;
    map['emailAddress'] = emailAddress;
    map['profilePictureUrl'] = profilePictureUrl;
    map['allowSetPassword'] = allowSetPassword;
    map['userType'] = userType;
    map['userToken'] = userToken;
    map['lastSeen'] = lastSeen;
    map['title'] = title;
    if (roles != null) {
      map['roles'] = roles?.map((v) => v.toJson()).toList();
    }
    map['id'] = id;
    return map;
  }

}