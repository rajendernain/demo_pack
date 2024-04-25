import 'dart:convert';

import 'package:api_projects/common/shared_pref.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../models/empListResponseModel.dart';
import '../models/empProfileModel.dart';
import '../models/login_request_model.dart';
import '../models/login_response_model.dart';

class EmployeeListRepo {
  Future<EmpListResponseModel> employeeList()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // Define your headers
    Map<String, String> headers = {
      'Authorization': 'Bearer ${prefs.getString(SharedPref.authTokenKey)}', // E
      'deviceid': '123456'// xample header
    };
    // Define your POST data
    Map<String, dynamic> postData = {};
    //Send request to api for get employees list
    var response = await http.post(Uri.parse("https://status.keyss.in/apin/v2/employee"),
          headers: headers,
          body: postData,
        );

    if(response.statusCode == 200){
      Map<String, dynamic> decodedData = jsonDecode(response.body);
      return EmpListResponseModel.fromJson(decodedData);
    }else{
      throw Exception("Failed to load employee");
    }
  }
  //Get employee profile data
  Future<EmpProfileModel> employeeProfile()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // Define your headers
    Map<String, String> headers = {
      'Authorization': 'Bearer ${prefs.getString(SharedPref.authTokenKey)}', // E
      'deviceid': '123456'// xample header
    };
    // Define your POST data
    Map<String, dynamic> postData = {};
    //Send request to api for get employees list
    var response = await http.post(Uri.parse("https://status.keyss.in/apin/v2/profile"),
      headers: headers,
      body: postData,
    );
    if(response.statusCode == 200){
      Map<String, dynamic> decodedData = jsonDecode(response.body);
      return EmpProfileModel.fromJson(decodedData);
    }else{
      throw Exception("Failed to load profile");
    }
  }
}