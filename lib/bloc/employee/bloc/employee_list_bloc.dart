import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../models/empListResponseModel.dart';
import '../../../repo/employee_repo.dart';

part 'employee_list_event.dart';
part 'employee_list_state.dart';

class EmployeeListBloc extends Bloc<EmployeeListEvent, EmployeeListState> {
  final EmployeeListRepo empListRepo;

  EmployeeListBloc(this.empListRepo) : super(PageInit()) {
    final EmployeeListRepo empListRepo = EmployeeListRepo();
    on<LoadEmpListEvent>((event, emit) async {
      emit(EmployeeLoadingState());
      EmpListResponseModel? empData = await empListRepo.employeeList();
      String? message = empData.message;

      if(empData.status == 'success'){
        emit(EmployeeLoadedState(empData, message!));
      }else {
        emit(EmployeeErrorState(message!));
      }
    });
  }
}
