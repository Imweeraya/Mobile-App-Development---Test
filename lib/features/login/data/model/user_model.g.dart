// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
  id: (json['id'] as num).toInt(),
  email: json['email'] as String,
  firstName: json['firstName'] as String,
  lastName: json['lastName'] as String,
  createdAt: json['createdAt'] as String,
  updatedAt: json['updatedAt'] as String?,
  deletedAt: json['deletedAt'] as String?,
  roles:
      (json['roles'] as List<dynamic>)
          .map((e) => Role.fromJson(e as Map<String, dynamic>))
          .toList(),
  organizations: json['organizations'] as List<dynamic>,
  providers: json['providers'] as List<dynamic>,
  deletedById: json['deletedById'] as String?,
  updatedById: json['updatedById'] as String?,
  createdById: (json['createdById'] as num).toInt(),
  refreshToken: json['refreshToken'] as String,
);

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
  'id': instance.id,
  'email': instance.email,
  'firstName': instance.firstName,
  'lastName': instance.lastName,
  'createdAt': instance.createdAt,
  'updatedAt': instance.updatedAt,
  'deletedAt': instance.deletedAt,
  'roles': instance.roles,
  'organizations': instance.organizations,
  'providers': instance.providers,
  'deletedById': instance.deletedById,
  'updatedById': instance.updatedById,
  'createdById': instance.createdById,
  'refreshToken': instance.refreshToken,
};

Role _$RoleFromJson(Map<String, dynamic> json) =>
    Role(name: json['name'] as String);

Map<String, dynamic> _$RoleToJson(Role instance) => <String, dynamic>{
  'name': instance.name,
};
