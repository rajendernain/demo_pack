import 'package:api_projects/common/shared_pref.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../repo/login_repo.dart';

part 'logout_event.dart';
part 'logout_state.dart';

class LogoutBloc extends Bloc<LogoutEvent, LogoutState> {
  final LoginRepo loginRepo = LoginRepo();
  LogoutBloc() : super(LogoutInitial()) {
    on<LogoutEvent>((event, emit) {
      _handleLogout();// Remove specific key
      emit(LogOutState());
    });
  }

  void _handleLogout() async {
      // Remove auth token
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.remove(SharedPref.authTokenKey);
  }

}
