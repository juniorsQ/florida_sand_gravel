import 'package:json_annotation/json_annotation.dart';
part 'user_register.g.dart';

@JsonSerializable()
class UserRegister {
  final int? id;
  final String name;
  final String lastName;
  final String email;
  final String phoneNumber;
  final String truckNumber;
  final int transportDivisionId;
  final String password;
  final String repeatPassword;
  final bool? valid;
  final String? createdAt;
  final String? updatedAt;


  UserRegister({
    this.id,
    required this.name,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.truckNumber,
    required this.transportDivisionId,
    required this.password,
    required this.repeatPassword,
    this.valid,
    this.createdAt, 
    this.updatedAt,
    
  });

  factory UserRegister.fromJson(Map<String, dynamic> json) => _$UserRegisterFromJson(json);
  Map<String, dynamic> toJson() => _$UserRegisterToJson(this);
}