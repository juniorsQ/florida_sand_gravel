import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class UserRole {
  final int id;
  final String name;

  UserRole({required this.id, required this.name});

  factory UserRole.fromJson(Map<String, dynamic> json) =>
      _$UserRoleFromJson(json);
  Map<String, dynamic> toJson() => _$UserRoleToJson(this);
}

@JsonSerializable()
class User {
  final String email;
  final String name;
  final String? lastName;
  final UserRole ? role; 

  User({  
    required this.email,
    required this.name,
    this.lastName,
    this.role, 
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}


@JsonSerializable()
class AuthResponse {
  final String token; //  El tokeen esta agregado a la respuesta  JuniorsQ
  final User user; //  user es un objeto dentro viene role JuniorsQ

  AuthResponse({required this.token, required this.user});

  factory AuthResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseFromJson(json);
  Map<String, dynamic> toJson() => _$AuthResponseToJson(this);
}
