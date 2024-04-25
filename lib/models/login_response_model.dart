// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  String? status;
  Data? data;
  String? message;

  LoginModel({
    this.status,
    this.data,
    this.message,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    status: json["status"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data?.toJson(),
    "message": message,
  };
}

class Data {
  int? userId;
  String? name;
  String? email;
  String? role;
  String? accessToken;
  String? deviceid;
  int? companyId;
  Notification? notification;
  Permissions? permissions;
  bool? isAppraiser;
  bool? readPolicy;
  DateTime? dob;
  DateTime? joiningDate;
  String? designation;
  DateTime? nextAppraisalDate;
  String? contact;
  String? bankName;
  String? branchName;
  String? accountNumber;
  String? accountHolderName;
  String? ifscCode;
  String? panNo;

  Data({
    this.userId,
    this.name,
    this.email,
    this.role,
    this.accessToken,
    this.deviceid,
    this.companyId,
    this.notification,
    this.permissions,
    this.isAppraiser,
    this.readPolicy,
    this.dob,
    this.joiningDate,
    this.designation,
    this.nextAppraisalDate,
    this.contact,
    this.bankName,
    this.branchName,
    this.accountNumber,
    this.accountHolderName,
    this.ifscCode,
    this.panNo,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    userId: json["user_id"],
    name: json["name"],
    email: json["email"],
    role: json["role"],
    accessToken: json["access_token"],
    deviceid: json["deviceid"],
    companyId: json["company_id"],
    notification: json["notification"] == null ? null : Notification.fromJson(json["notification"]),
    permissions: json["permissions"] == null ? null : Permissions.fromJson(json["permissions"]),
    isAppraiser: json["is_appraiser"],
    readPolicy: json["read_policy"],
    dob: json["dob"] == null ? null : DateTime.parse(json["dob"]),
    joiningDate: json["joining_date"] == null ? null : DateTime.parse(json["joining_date"]),
    designation: json["designation"],
    nextAppraisalDate: json["next_appraisal_date"] == null ? null : DateTime.parse(json["next_appraisal_date"]),
    contact: json["contact"],
    bankName: json["bank_name"],
    branchName: json["branch_name"],
    accountNumber: json["account_number"],
    accountHolderName: json["account_holder_name"],
    ifscCode: json["ifsc_code"],
    panNo: json["pan_no"],
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "name": name,
    "email": email,
    "role": role,
    "access_token": accessToken,
    "deviceid": deviceid,
    "company_id": companyId,
    "notification": notification?.toJson(),
    "permissions": permissions?.toJson(),
    "is_appraiser": isAppraiser,
    "read_policy": readPolicy,
    "dob": dob?.toIso8601String(),
    "joining_date": joiningDate?.toIso8601String(),
    "designation": designation,
    "next_appraisal_date": nextAppraisalDate?.toIso8601String(),
    "contact": contact,
    "bank_name": bankName,
    "branch_name": branchName,
    "account_number": accountNumber,
    "account_holder_name": accountHolderName,
    "ifsc_code": ifscCode,
    "pan_no": panNo,
  };
}

class Notification {
  String? self;
  String? appraiser;

  Notification({
    this.self,
    this.appraiser,
  });

  factory Notification.fromJson(Map<String, dynamic> json) => Notification(
    self: json["self"],
    appraiser: json["appraiser"],
  );

  Map<String, dynamic> toJson() => {
    "self": self,
    "appraiser": appraiser,
  };
}

class Permissions {
  List<String>? user;
  List<dynamic>? admin;

  Permissions({
    this.user,
    this.admin,
  });

  factory Permissions.fromJson(Map<String, dynamic> json) => Permissions(
    user: json["user"] == null ? [] : List<String>.from(json["user"]!.map((x) => x)),
    admin: json["admin"] == null ? [] : List<dynamic>.from(json["admin"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "user": user == null ? [] : List<dynamic>.from(user!.map((x) => x)),
    "admin": admin == null ? [] : List<dynamic>.from(admin!.map((x) => x)),
  };
}
