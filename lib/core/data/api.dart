class Api {
  static const baseUrl = 'http://localhost:8000/api/';
  //auth
  static const signup = 'auth/register';
  static const login = 'login';
  static const sendOtp = 'auth/otp/send';
  static const verifyOtp = 'auth/otp/verify';
  static const resendOtp = 'auth/otp/resend';
  static const logout = 'logout';

  static Map<String, String> get headers => {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  static Map<String, String> authHeaders(String token) => {
    ...headers,
    'Authorization': 'Bearer $token',
  };
}
