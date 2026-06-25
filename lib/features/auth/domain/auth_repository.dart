import 'package:chop_gang/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<UserEntity> signUp({
    required String fullName,
    required String email,
    required String password,
    required String confirmPassword,
    required String phone,
  });

  Future<UserEntity> login({
    required String email,
    required String password,
  });

  Future<bool> verifyOtp({
    required String email,
    required String otp,
  });

  Future<void> resendOtp({
    required String email,
  });

  Future<void> logout();
}
