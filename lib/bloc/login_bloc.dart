import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../common/shared_pref.dart';
import '../models/login_response_model.dart';
import '../models/login_request_model.dart';
import '../repo/login_repo.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  String? emailErr;
  String? passwordErr;

  LoginBloc(LoginState initialState) : super(PageInit()) {
    final LoginRepo loginRepo = LoginRepo();
    on<LoginTapped>((LoginTapped event, Emitter<LoginState> emit) async{
        emit(LoginButtonPressed());
        emailErr = validateEmail(event.email);
        passwordErr = validatePassword(event.password);
        if(emailErr != null){
          emit(EmailValidate(emailErr));
        }else if(passwordErr != null){
          emit(PasswordValidate(passwordErr));
        }else{
          emit(PageLoading());
          String? deviceId='12345';
          //set data in request model
          LoginRequestModel loginRequestModel = LoginRequestModel(
            name: event.email,
            password: event.password
          );

          LoginModel? loginData = await loginRepo.login(loginRequestModel: loginRequestModel);

          String? message = loginData.message;

          if(loginData.status != 'fail'){
            SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.setInt(SharedPref.userIdKey, loginData.data?.userId??0);
            await prefs.setString(SharedPref.authTokenKey, loginData.data?.accessToken??'');
            await prefs.setString(SharedPref.roleKey, loginData.data?.role??'');
            await prefs.setString(SharedPref.nameKey, loginData.data?.name??'');
            await prefs.setString(SharedPref.emailKey, loginData.data?.email??'');

            emit(LoginSuccess(loginData, message!));
          }else if(loginData.status == 'fail'){
            emit(LoginErrorState(message!));
          }else{
            print('something went wrong');
          }

        }
    });

    on<TextFieldTapped>((TextFieldTapped event, Emitter<LoginState> emit) {
      emailErr = null;
      passwordErr = null;
      emit(ClearErrMsg());
    });

  }

  String? validateEmail(String? email) {
    if (email!.isEmpty) {
      return "Please enter email";
    } else {
      return null;
    }
  }

  String? validatePassword(String password) {
    if (password.isEmpty) {
      return "Please enter password123";
    } else {
      return null;
    }
  }

  // final LoginRepo loginRepo;
  // LoginBloc(this.loginRepo) : super(LoginLoadingState()) {
  //   on<LoginLoadedEvent>((event, emit) async{
  //     try{
  //       emit(LoginLoadingState());
  //       var data = await loginRepo.login();
  //       emit(LoginLoadedState(data));
  //     }catch(e){
  //       emit(LoginErrorState(e.toString()));
  //     }
  //   });
  // }
}
