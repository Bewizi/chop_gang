import 'package:chop_gang/core/data/api.dart';
import 'package:chop_gang/core/data/api_client.dart';
import 'package:chop_gang/features/auth/data/models/user_model.dart';
import 'package:chop_gang/features/auth/domain/auth_repository.dart';
import 'package:chop_gang/features/auth/domain/entities/user_entity.dart';

class AuthData implements AuthRepository {
  AuthData(this._apiClient);

  final ApiClient _apiClient;

  @override
  Future<UserEntity> signUp({
    required String fullName,
    required String email,
    required String password,
    required String confirmPassword,
    required String phone,
  }) async {
    final response = await _apiClient.post(
      Api.signup,
      data: {
        'full_name': fullName,
        'email': email,
        'phone': phone,
        'password': password,
        'password_confirmation': confirmPassword,
      },
    );

    final data = response.data;
    if (data is Map<String, dynamic>) {
      return UserModel.fromJson(data).toEntity();
    }
    throw Exception('Invalid response format');
  }

  @override
  Future<UserEntity> login({
    required String email,
    required String password,
  }) async {
    final response = await _apiClient.post(
      Api.login,
      data: {
        'email': email,
        'password': password,
      },
    );

    final data = response.data;
    if (data is Map<String, dynamic>) {
      final userModel = UserModel.fromJson(data);

      // If the token is returned, you might want to save it.
      // The ApiClient or an Interceptor usually handles adding it to headers,
      // but you still need to persist it.
      if (userModel.token != null) {
        _apiClient.setToken(userModel.token!);
        // Note: You should also persist this to secure storage
        // (usually handled in the Repository or a dedicated SessionManager)
      }

      return userModel.toEntity();
    }
    throw Exception('Login failed: Invalid response');
  }

  @override
  Future<bool> verifyOtp({
    required String email,
    required String otp,
  }) async {
    final response = await _apiClient.post(
      Api.verifyOtp,
      data: {
        'email': email,
        'otp': otp,
      },
    );

    final data = response.data;
    if (data is Map<String, dynamic>) {
      return data['verified'] as bool? ?? false;
    }
    return false;
  }

  @override
  Future<void> resendOtp({
    required String email,
  }) async {
    await _apiClient.post(
      Api.resendOtp,
      data: {
        'email': email,
      },
    );
  }

  @override
  Future<void> logout() async {
    await _apiClient.post(Api.logout);
    _apiClient.clearToken();
  }
}
