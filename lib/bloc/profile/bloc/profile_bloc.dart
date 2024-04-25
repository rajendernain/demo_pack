import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../models/empProfileModel.dart';
import '../../../repo/employee_repo.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final EmployeeListRepo empListRepo;
  ProfileBloc(this.empListRepo) : super(ProfileInitial()) {
    final EmployeeListRepo empListRepo = EmployeeListRepo();
    on<ProfileEvent>((event, emit) async {
      emit(ProfileLoadingState());
      EmpProfileModel? profileData = await empListRepo.employeeProfile();
      String? message = profileData.message;

      if(profileData.status == 'success in response'){
        emit(ProfileLoadedState(profileData, message));
      }else{
        emit(ProfileErrorState(message!));
      }

    });
  }
}
