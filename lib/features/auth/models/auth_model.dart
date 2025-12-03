class AuthModel {
  AuthModel({
    this.user,
    this.access,
    this.refresh,
  });

  AuthModel.fromJson(dynamic json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    access = json['access'];
    refresh = json['refresh'];
  }

  User? user;
  String? access;
  String? refresh;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['access'] = access;
    map['refresh'] = refresh;
    return map;
  }
}

class User {
  User({
    this.id,
    this.shortId,
    this.lastLogin,
    this.isSuperuser,
    this.isStaff,
    this.dateJoined,
    this.firstName,
    this.lastName,
    this.email,
    this.role,
    this.gender,
    this.countryCode,
    this.phoneNumber,
    this.sortOrder,
    this.isDoctor,
    this.isOwner,
    this.isActive,
    this.isNumberCorrect,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.createdBy,
    this.userPermissions,
    this.numberOfWebsiteVisits,
  });

  User.fromJson(dynamic json) {
    id = json['id'];
    shortId = json['short_id'];
    profileUrl = json['profile_url'];
    refferalUrl = json['refferal_url'];
    lastLogin = json['last_login'];
    numberOfWebsiteVisits = json['number_of_website_visits'];
    isSuperuser = json['is_superuser'];
    isStaff = json['is_staff'];
    dateJoined = json['date_joined'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    role = json['role'];
    gender = json['gender'];
    countryCode = json['country_code'];
    phoneNumber = json['phone_number'];
    fullPhoneNumber = json['full_phone_number'];
    image = json['image'];
    sortOrder = json['sort_order'];
    isDoctor = json['is_doctor'];
    isOwner = json['is_owner'];
    isActive = json['is_active'];
    isNumberCorrect = json['is_number_correct'];
    createdBy = json['created_by'];
    if (json['user_permissions'] != null) {
      userPermissions = [];
      json['user_permissions'].forEach((v) {
        userPermissions?.add(v);
      });
    }
  }

  String? id;
  String? shortId;
  String? lastLogin;
  bool? isSuperuser;
  bool? isStaff;
  String? dateJoined;
  String? firstName;
  String? lastName;
  String? email;
  String? role;
  String? gender;
  String? countryCode;
  dynamic phoneNumber;
  int? sortOrder;
  bool? isDoctor;
  bool? isOwner;
  bool? isActive;
  bool? isNumberCorrect;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  dynamic createdBy;
  List<dynamic>? userPermissions;
  dynamic fullPhoneNumber;
  dynamic image;
  String? profileUrl;
  String? refferalUrl;
  int? numberOfWebsiteVisits;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['last_login'] = lastLogin;
    map['is_superuser'] = isSuperuser;
    map['is_staff'] = isStaff;
    map['date_joined'] = dateJoined;
    map['first_name'] = firstName;
    map['last_name'] = lastName;
    map['email'] = email;
    map['role'] = role;
    map['gender'] = gender;
    map['country_code'] = countryCode;
    map['phone_number'] = phoneNumber;
    map['sort_order'] = sortOrder;
    map['is_doctor'] = isDoctor;
    map['is_owner'] = isOwner;
    map['is_active'] = isActive;
    map['is_number_correct'] = isNumberCorrect;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['deleted_at'] = deletedAt;
    map['created_by'] = createdBy;
    if (userPermissions != null) {
      map['user_permissions'] =
          userPermissions?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}