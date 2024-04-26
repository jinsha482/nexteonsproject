class DbKey {
//!---Private
  final String _token = 'access_token';
  final String _refreshToken = 'refresh_token';
//!---Getter
  String get tokenKey => _token;
  String get refreshTokenKey => _refreshToken;
}
