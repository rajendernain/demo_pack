part of 'profile_bloc.dart';

sealed class ProfileState extends Equatable {
  const ProfileState();
  
  @override
  List<Object> get props => [];
}

final class ProfileInitial extends ProfileState {}

final class ProfileLoadingState extends ProfileState {}

class ProfileLoadedState extends ProfileState {
  final EmpProfileModel profileResponseModel;
  final String? message;
  const ProfileLoadedState(this.profileResponseModel, this.message);
}

final class ProfileErrorState extends ProfileState {
  final String errorMessage;
  const ProfileErrorState(this.errorMessage);
  @override
  List<Object> get props => [errorMessage];
}