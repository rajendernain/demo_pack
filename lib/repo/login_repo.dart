import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/login_request_model.dart';
import '../models/login_response_model.dart';
import '../models/products_model.dart';

class LoginRepo {
  Future<LoginModel> login({required LoginRequestModel loginRequestModel})async{
    // Define your headers
    Map<String, String> headers = {
      'deviceid': '123456'// xample header
    };
    // Define your POST data
    Map<String, dynamic> postData = {
      "name": loginRequestModel.name,
      "password": loginRequestModel.password
    };

    var response = await http.post(Uri.parse("https://status.keyss.in/apin/v2/login_p/keyss"),
        headers: headers,
        body: postData,
      );
    if(response.statusCode == 200){
      return loginModelFromJson(response.body);
    }else{
      throw Exception("Failed to load Products");
    }
  }

  // //if we logout from server then need to remove session from server
  // Future<LoginModel> logout({required LoginRequestModel loginRequestModel})async{
  //   var response = await http.post(Uri.parse("https://status.keyss.in/apin/v2/login_p/keyss"),
  //       body: {
  //         "name": loginRequestModel.name,
  //         "password": loginRequestModel.password
  //       }
  //   );
  //
  //   if(response.statusCode == 200){
  //     return loginModelFromJson(response.body);
  //   }else{
  //     throw Exception("Failed to load Products");
  //   }
  // }
}