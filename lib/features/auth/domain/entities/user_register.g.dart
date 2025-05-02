// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_register.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserRegister _$UserRegisterFromJson(Map<String, dynamic> json) => UserRegister(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String,
      lastName: json['lastName'] as String,
      email: json['email'] as String,
      phoneNumber: json['phoneNumber'] as String,
      truckNumber: json['truckNumber'] as String,
      transportDivisionId: (json['transportDivisionId'] as num).toInt(),
      password: json['password'] as String,
      repeatPassword: json['repeatPassword'] as String,
      valid: json['valid'] as bool?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$UserRegisterToJson(UserRegister instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'lastName': instance.lastName,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'truckNumber': instance.truckNumber,
      'transportDivisionId': instance.transportDivisionId,
      'password': instance.password,
      'repeatPassword': instance.repeatPassword,
      'valid': instance.valid,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
