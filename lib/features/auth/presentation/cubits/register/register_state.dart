import 'package:equatable/equatable.dart';

abstract class RegisterState extends Equatable {
  @override
  List<Object?> get props => [];
}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSuccess extends RegisterState {
  final String message; // Opcional: Puedes agregar datos del usuario registrado

  RegisterSuccess({this.message = "Registro exitoso"});

  @override
  List<Object?> get props => [message];
}

class RegisterFailure extends RegisterState {
  final String error;

  RegisterFailure({required this.error});

  @override
  List<Object?> get props => [error];
}