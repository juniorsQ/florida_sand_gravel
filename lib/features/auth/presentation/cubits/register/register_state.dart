abstract class RegisterState {}

class RegisterInitial extends RegisterState {
    @override
  List<Object?> get props => [];
}

class RegisterLoading extends RegisterState {}

class RegisterSuccess extends RegisterState {
  @override
  List<Object?> get props => [];
  // Puedes agregar propiedades si es necesario 
}

class RegisterFailure extends RegisterState {
  final String error;
  RegisterFailure({required this.error});
}