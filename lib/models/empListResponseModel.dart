class EmpListResponseModel {
  EmpListResponseModel({
    required this.status,
    required this.data,
    required this.message,
  });
  late final String status;
  late final List<Data> data;
  late final String message;

  EmpListResponseModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['data'] = data.map((e)=>e.toJson()).toList();
    _data['message'] = message;
    return _data;
  }
}

class Data {
  Data({
    required this.empId,
    required this.name,
    required this.emailId,
    required this.dob,
    required this.joiningDate,
    required this.designation,
    required this.lastAppraisalDate,
    required this.nextAppraisalDate,
    required this.appraiserId,
    required this.leavingDate,
    required this.sendMail,
    required this.privileges,
  });
  late final int empId;
  late final String name;
  late final String emailId;
  late final String dob;
  late final String joiningDate;
  late final String designation;
  late final String lastAppraisalDate;
  late final String nextAppraisalDate;
  late final int appraiserId;
  late final String leavingDate;
  late final String sendMail;
  late final String privileges;

  Data.fromJson(Map<String, dynamic> json){
    empId = json['emp_id'];
    name = json['name'];
    emailId = json['email_id'];
    dob = json['dob'];
    joiningDate = json['joining_date'];
    designation = json['designation'];
    lastAppraisalDate = json['last_appraisal_date'];
    nextAppraisalDate = json['next_appraisal_date'];
    appraiserId = json['appraiser_id'];
    leavingDate = json['leaving_date'];
    sendMail = json['send_mail'];
    privileges = json['privileges'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['emp_id'] = empId;
    _data['name'] = name;
    _data['email_id'] = emailId;
    _data['dob'] = dob;
    _data['joining_date'] = joiningDate;
    _data['designation'] = designation;
    _data['last_appraisal_date'] = lastAppraisalDate;
    _data['next_appraisal_date'] = nextAppraisalDate;
    _data['appraiser_id'] = appraiserId;
    _data['leaving_date'] = leavingDate;
    _data['send_mail'] = sendMail;
    _data['privileges'] = privileges;
    return _data;
  }
}