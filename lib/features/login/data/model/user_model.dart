import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String createdAt;
  final String? updatedAt;
  final String? deletedAt;
  final List<Role> roles;
  final List<dynamic> organizations;
  final List<dynamic> providers;
  final String? deletedById;
  final String? updatedById;
  final int createdById;
  final String refreshToken;

  UserModel({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.createdAt,
    this.updatedAt,
    this.deletedAt,
    required this.roles,
    required this.organizations,
    required this.providers,
    this.deletedById,
    this.updatedById,
    required this.createdById,
    required this.refreshToken,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}

@JsonSerializable()
class Role {
  final String name;

  Role({required this.name});

  factory Role.fromJson(Map<String, dynamic> json) => _$RoleFromJson(json);

  Map<String, dynamic> toJson() => _$RoleToJson(this);
}
