import 'package:chop_gang/features/auth/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.id,
    required super.fullName,
    required super.email,
    super.phone,
    super.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    // Handling potential differences in backend keys (full_name vs fullName)
    return UserModel(
      id: json['id'] as int? ?? 0,
      fullName: (json['full_name'] ?? json['fullName']) as String? ?? '',
      email: json['email'] as String? ?? '',
      phone: json['phone'] as String?,
      token: json['token'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'full_name': fullName,
      'email': email,
      'phone': phone,
      'token': token,
    };
  }

  UserEntity toEntity() => UserEntity(
        id: id,
        fullName: fullName,
        email: email,
        phone: phone,
        token: token,
      );
}
