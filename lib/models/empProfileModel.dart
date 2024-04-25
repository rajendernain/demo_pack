// To parse this JSON data, do
//
//     final empProfileModel = empProfileModelFromJson(jsonString);

import 'dart:convert';

EmpProfileModel empProfileModelFromJson(String str) => EmpProfileModel.fromJson(json.decode(str));

String empProfileModelToJson(EmpProfileModel data) => json.encode(data.toJson());

class EmpProfileModel {
  String? status;
  List<Datum>? data;
  String? message;

  EmpProfileModel({
    this.status,
    this.data,
    this.message,
  });

  factory EmpProfileModel.fromJson(Map<String, dynamic> json) => EmpProfileModel(
    status: json["status"],
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "message": message,
  };
}

class Datum {
  int? userid;
  int? companyId;
  String? name;
  String? emailId;
  String? dob;
  String? joiningDate;
  String? designation;
  String? appraisarName;
  String? lastAppraisalDate;
  String? nextAppraisalDate;
  String? contact;
  String? sContact;
  String? bankName;
  String? branchName;
  String? accountNumber;
  String? accountHolderName;
  String? ifscCode;
  String? panNo;
  String? cAddress;
  int? pendingLeaves;
  String? earned;
  String? casual;
  String? medical;
  String? permanentAddress;
  List<String>? projectName;
  List<dynamic>? clientName;

  Datum({
    this.userid,
    this.companyId,
    this.name,
    this.emailId,
    this.dob,
    this.joiningDate,
    this.designation,
    this.appraisarName,
    this.lastAppraisalDate,
    this.nextAppraisalDate,
    this.contact,
    this.sContact,
    this.bankName,
    this.branchName,
    this.accountNumber,
    this.accountHolderName,
    this.ifscCode,
    this.panNo,
    this.cAddress,
    this.pendingLeaves,
    this.earned,
    this.casual,
    this.medical,
    this.permanentAddress,
    this.projectName,
    this.clientName,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    userid: json["userid"],
    companyId: json["company_id"],
    name: json["name"],
    emailId: json["email_id"],
    dob: json["dob"],
    joiningDate: json["joining_date"],
    designation: json["designation"],
    appraisarName: json["appraisar_name"],
    lastAppraisalDate: json["last_appraisal_date"],
    nextAppraisalDate: json["next_appraisal_date"],
    contact: json["contact"],
    sContact: json["s_contact"],
    bankName: json["bank_name"],
    branchName: json["branch_name"],
    accountNumber: json["account_number"],
    accountHolderName: json["account_holder_name"],
    ifscCode: json["IFSC_code"],
    panNo: json["PAN_no"],
    cAddress: json["c_address"],
    pendingLeaves: json["pending_leaves"],
    earned: json["earned"],
    casual: json["casual"],
    medical: json["medical"],
    permanentAddress: json["permanent_address"],
    projectName: json["project_name"] == null ? [] : List<String>.from(json["project_name"]!.map((x) => x)),
    clientName: json["client_name"] == null ? [] : List<dynamic>.from(json["client_name"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "userid": userid,
    "company_id": companyId,
    "name": name,
    "email_id": emailId,
    "dob": dob,
    "joining_date": joiningDate,
    "designation": designation,
    "appraisar_name": appraisarName,
    "last_appraisal_date": lastAppraisalDate,
    "next_appraisal_date": nextAppraisalDate,
    "contact": contact,
    "s_contact": sContact,
    "bank_name": bankName,
    "branch_name": branchName,
    "account_number": accountNumber,
    "account_holder_name": accountHolderName,
    "IFSC_code": ifscCode,
    "PAN_no": panNo,
    "c_address": cAddress,
    "pending_leaves": pendingLeaves,
    "earned": earned,
    "casual": casual,
    "medical": medical,
    "permanent_address": permanentAddress,
    "project_name": projectName == null ? [] : List<dynamic>.from(projectName!.map((x) => x)),
    "client_name": clientName == null ? [] : List<dynamic>.from(clientName!.map((x) => x)),
  };
}
