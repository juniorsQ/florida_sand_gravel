import 'package:florida_sand_gravel/features/auth/domain/entities/user.dart';
import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final AuthResponse authResponse; 
  LoginSuccess(this.authResponse);
}

class LoginFailure extends LoginState {
  final String error;
  LoginFailure({required this.error});
}