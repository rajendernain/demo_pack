part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();
  @override
  List<Object> get props => [];
}


class LoadEmpProfileEvent extends ProfileEvent{
  const LoadEmpProfileEvent();
  @override
  List<Object> get props => [];
}