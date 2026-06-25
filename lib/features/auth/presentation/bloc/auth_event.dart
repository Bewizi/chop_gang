part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class SignupParams {
  const SignupParams({
    required this.fullName,
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.phone,
  });

  final String fullName;
  final String email;
  final String password;
  final String confirmPassword;
  final String phone;
}

class AuthSignUpRequested extends AuthEvent {
  const AuthSignUpRequested({required this.params});

  final SignupParams params;

  @override
  List<Object> get props => [params];
}

class AuthLoginRequested extends AuthEvent {
  const AuthLoginRequested({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;
}

class AuthVerifyOtpRequested extends AuthEvent {
  const AuthVerifyOtpRequested({
    required this.email,
    required this.otp,
  });

  final String email;
  final String otp;
}

class AuthResendOtpRequested extends AuthEvent {
  const AuthResendOtpRequested({
    required this.email,
  });

  final String email;
}

class AuthLogoutRequested extends AuthEvent {}
