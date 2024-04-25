part of 'employee_list_bloc.dart';

abstract class EmployeeListState extends Equatable {
  const EmployeeListState();
  @override
  List<Object> get props => [];
}
class PageInit extends EmployeeListState {
  @override
  String toString() => 'PageInit';
}

final class EmployeeListInitial extends EmployeeListState {}

class EmployeeLoadingState extends EmployeeListState {}

class EmployeeLoadedState extends EmployeeListState {
  final EmpListResponseModel empResponseModel;
  final String? message;
  const EmployeeLoadedState(this.empResponseModel, this.message);
}

final class EmployeeErrorState extends EmployeeListState {
  final String errorMessage;
  const EmployeeErrorState(this.errorMessage);
  @override
  List<Object> get props => [errorMessage];
}
