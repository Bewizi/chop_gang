import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  const UserEntity({
    required this.id,
    required this.fullName,
    required this.email,
    this.phone,
    this.token,
  });

  final int id;
  final String fullName;
  final String email;
  final String? phone;
  final String? token;

  @override
  List<Object?> get props => [id, fullName, email, phone, token];
}
