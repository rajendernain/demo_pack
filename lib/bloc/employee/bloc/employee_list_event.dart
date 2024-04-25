part of 'employee_list_bloc.dart';

abstract class EmployeeListEvent extends Equatable {
  const EmployeeListEvent();

  @override
  List<Object> get props => [];
}


class LoadEmpListEvent extends EmployeeListEvent{
  const LoadEmpListEvent();

  @override
  List<Object> get props => [];
}